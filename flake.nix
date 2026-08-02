{
  description = "My NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    private-themes = {
      url = "git+https://github.com/TaiTan291/dot-private-themes.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # astal = {
    #   url = "github:aylur/astal";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # ags = {
    #   url = "github:aylur/ags";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.git-hooks-nix.flakeModule
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
            shfmt = {
              enable = true;
              includes = ["*.sh" "*.bash" "*.zsh"];
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
          shellHook = ''
            ${config.pre-commit.installationScript}
          '';
        };
      };

      flake = let
        # ホスト名を受け取って nixosSystem を返すヘルパー関数
        cofHost = host:
          inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {inherit inputs;};
            modules = [
              ./host/${host}/configuration.nix
              {nixpkgs.overlays = [inputs.nur.overlays.default];}
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.taitan.imports = [
                    inputs.nixvim.homeModules.nixvim
                    ./host/${host}/home.nix
                  ];
                  extraSpecialArgs = {inherit inputs host;};
                  backupFileExtension = "bkup";
                };
              }
            ];
          };
        homeHost = host:
          inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = import inputs.nixpkgs {
              system = "x86_64-linux";
              overlays = [inputs.nur.overlays.default];
            };
            modules = [
              inputs.nixvim.homeModules.nixvim
              ./host/${host}/home.nix
            ];
            extraSpecialArgs = {inherit inputs host;};
          };
      in {
        nixosConfigurations = {
          laptop = cofHost "laptop";
          desktop = cofHost "desktop";
          wsl = cofHost "wsl";
        };
        homeConfigurations = {
          code = homeHost "code";
        };
      };
    };
}
