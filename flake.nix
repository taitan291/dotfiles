{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    # nixos-wsl = {
    #   url = "github:nix-community/NixOS-WSL";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    flake-parts,
    nur,
    home-manager,
    treefmt-nix,
    git-hooks-nix,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        treefmt-nix.flakeModule
        git-hooks-nix.flakeModule
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            stylua.enable = true;
            prettier = {
              enable = true;
              includes = ["*.css"];
            };
          };
        };
        formatter = config.treefmt.build.wrapper;

        pre-commit.settings = {
          hooks = {
            treefmt.enable = true;
          };
        };
        devShells.default = pkgs.mkShell {
          # ...既存のdevShells設定...
          shellHook = ''
            ${config.pre-commit.installationScript}
          '';
        };
      };

      flake = let
        # ホスト名を受け取って nixosSystem を返すヘルパー関数
        mkHost = host:
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {inherit inputs;};
            modules = [
              ./host/${host}/configuration.nix
              ./host/${host}/hardware-configuration.nix
              ({...}: {nixpkgs.overlays = [nur.overlays.default];})
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.taitan.imports = [
                    inputs.nixvim.homeModules.nixvim
                    ./modules/home.nix
                    ./host/${host}/home.nix
                  ];
                  extraSpecialArgs = {inherit inputs;};
                  backupFileExtension = "bkup";
                };
              }
            ];
          };
      in {
        nixosConfigurations = {
          laptop = mkHost "laptop";
          desktop = mkHost "desktop";
        };
      };
    };
}
