{pkgs, ...}: let
  polycat = pkgs.stdenv.mkDerivation {
    pname = "polycat";
    version = "2.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "zzimt";
      repo = "polycat";
      rev = "f81e73bbb5de90a496bb0b844cdb3a93e54fbaad";
      sha256 = "sha256-wpDx6hmZe/dLv+F+kbo+YUIZ2A8XgnrZP0amkz6I5IQ=";
      fetchSubmodules = true;
    };

    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    makeFlags = [
      "PREFIX=$(out)"
      "POLYCAT_RELEASE=1"
    ];

    dontConfigure = true;
  };
in {
  home.packages = with pkgs; [
    polycat
  ];
  imports = [
    ./settings.nix
  ];
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
    ];
  };
}
