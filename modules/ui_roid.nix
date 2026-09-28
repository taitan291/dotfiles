{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.assistant-ui.homeManagerModules.default
  ];
  home.packages = [
    inputs.assistant-ui.packages.${pkgs.stdenv.hostPlatform.system}.assistant-ui
  ];
}
