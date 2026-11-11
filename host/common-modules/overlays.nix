{inputs, ...}: {
  nixpkgs.overlays = [
    (import ../../modules/nvim/overlays.nix)
    (import ../../modules/brave.nix)
    inputs.nur.overlays.default
    inputs.uindows-themes.overlays.default
    inputs.rskk.overlays.default
    inputs.assistant-ui.overlays.default
  ];
}
