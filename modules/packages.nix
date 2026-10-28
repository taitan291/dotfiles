{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch

    mission-center
    nwg-displays
    btop

    #anki
    brave
    #slack
    wine
    librsvg
    prismlauncher
    # vscode
    codex
    bitwarden-desktop

    assistant-ui
    rskk-wayland
  ];
}
