#home manager
{pkgs, ...}: {
  home = {
    stateVersion = "25.11";
    username = "taitan";
    homeDirectory = "/home/taitan";
    packages = with pkgs; [
      hunspell
      git-graph
      lazygit

      mission-center
      anki

      # Browser
      firefox
      brave

      # SNS
      discord
      slack

      direnv

      wine

      librsvg
    ];

    sessionVariables = {
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };

    file = {
      "Downloads/.keep".text = "";
      "working/.keep".text = "";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "brave.desktop";
      "x-scheme-handler/http" = "brave.desktop";
      "x-scheme-handler/https" = "brave.desktop";
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };

  programs.wofi = {
    enable = true;
  };
  programs.kitty.enable = true;

  imports = [
    ./nvim
    ./emacs
    ./code
    ./waybar
    ./starship
    ./file-manager/yazi.nix
    ./file-manager/thunar.nix
    ./git.nix
    ./bash.nix
    ./hypr
    ./fcitx5
    ./shell-unit.nix
    ./lang.nix
  ];
  programs.home-manager.enable = true;
}
