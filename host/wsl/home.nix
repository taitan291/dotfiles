{pkgs, ...}: {
  home.sessionVariables.BROWSER = "brave";
  imports = [../../modules/common.nix];
  home.packages = [pkgs.codex];
}
