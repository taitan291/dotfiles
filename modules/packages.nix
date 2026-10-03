{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch

    mission-center
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
  ];
}
