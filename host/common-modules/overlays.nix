{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.nur.overlays.default
    inputs.uindows-themes.overlays.default
    inputs.rskk.overlays.default
    inputs.assistant-ui.overlays.default
    inputs.dotNixvim.overlays.default
  ];
}
