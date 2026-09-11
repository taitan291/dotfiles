{...}: {
  nixpkgs.overlays = [
    (import ../../modules/nvim/overlays.nix)
  ];
}
