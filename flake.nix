{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    #	Rust
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Emacs
    emacs-overlay.url = "github:nix-community/emacs-overlay";

    # Formatter
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    rust-overlay,
    emacs-overlay,
    treefmt-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    treefmtConfig = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          ./hardware-configuration-laptop.nix
          {nixpkgs.overlays = [rust-overlay.overlays.default];}
          {nixpkgs.overlays = [emacs-overlay.overlays.default];}
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.taitan = {
                imports = [
                  inputs.nixvim.homeModules.nixvim
                  ./home.nix
                ];
              };
              extraSpecialArgs = {inherit inputs;};
              backupFileExtension = "bkup";
            };
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          ./hardware-configuration-desktop.nix
          {nixpkgs.overlays = [rust-overlay.overlays.default];}
          {nixpkgs.overlays = [emacs-overlay.overlays.default];}
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.taitan = {
                imports = [
                  inputs.nixvim.homeModules.nixvim
                  ./home.nix
                ];
              };
              extraSpecialArgs = {inherit inputs;};
              backupFileExtension = "bkup";
            };
          }
        ];
      };
    };

    formatter.${system} = treefmtConfig.config.build.wrapper;
    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = [treefmtConfig.config.build.wrapper];
    };
  };
}
