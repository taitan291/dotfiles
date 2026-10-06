{inputs, ...}: {
  nixpkgs.overlays = [
    (import ../../modules/nvim/overlays.nix)
    inputs.nur.overlays.default
    inputs.uindows-themes.overlays.default
  ];
}
