{pkgs, ...}: {
  home.packages = with pkgs; [
    thunar
    thunar-archive-plugin
  ];
  /*
  programs.thunar = {
  enable = true;
  plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  };
  services.tumbler.enable = true;
  */
}
