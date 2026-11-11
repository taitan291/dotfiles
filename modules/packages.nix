{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch

    mission-center
    nwg-displays
    btop

    #anki
    #slack
    wine
    librsvg
    prismlauncher
    # vscode
    # codex
    bitwarden-desktop
    brave

    assistant-ui
    rskk-wayland

    tigervnc
  ];
}
