{
	description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
		nur.url = "github:nix-community/NUR";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    /*
     nixos-wsl = {
    url = "github:nix-community/NixOS-WSL";
       inputs.nixpkgs.follows = "nixpkgs";
     };
    */
    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
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

		/*
    # Emacs
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		*/

    # Formatter
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		/*
		# plymouth theme
		plymouth-theme = {
			url = "git+file:///home/taitan/working/plymouth";
      inputs.nixpkgs.follows = "nixpkgs";
		};
		*/
  };

  outputs = {
    nixpkgs,
    home-manager,
    rust-overlay,
    #emacs-overlay,
    treefmt-nix,
		nur,
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
          ./host/laptop/configuration.nix
          ./host/laptop/hardware-configuration.nix
          {nixpkgs.overlays = [rust-overlay.overlays.default];}
          #{nixpkgs.overlays = [emacs-overlay.overlays.default];}
					({ ... }: {
          nixpkgs.overlays = [
            nur.overlays.default
          ];
        })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.taitan = {
                imports = [
                  inputs.nixvim.homeModules.nixvim
                  ./modules/home.nix
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
          ./host/desktop/configuration.nix
          ./host/desktop/hardware-configuration.nix
          {nixpkgs.overlays = [rust-overlay.overlays.default];}
          #{nixpkgs.overlays = [emacs-overlay.overlays.default];}
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.taitan = {
                imports = [
                  inputs.nixvim.homeModules.nixvim
                  ./modules/home.nix
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
