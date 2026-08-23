{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch

    mission-center
    #anki
    #firefox
    brave
    #slack
    wine
    librsvg
    prismlauncher
    vscode
  ];
}
