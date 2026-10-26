{inputs, ...}: {
  nixpkgs.overlays = [
    (import ../../modules/nvim/overlays.nix)
    inputs.nur.overlays.default
    inputs.uindows-themes.overlays.default
    inputs.rskk.overlays.default
    inputs.assistant-ui.overlays.default
  ];
}
