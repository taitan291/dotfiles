{pkgs, ...}: {
  home.packages = with pkgs; [
  ];
  imports = [
    ./settings.nix
  ];
}
