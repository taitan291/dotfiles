{ pkgs, ... }: {
  home.packages = with pkgs; [
    hunspell
    git-graph
    lazygit
    gti
    sl
    mission-center
    anki
    firefox
    brave
    slack
    direnv
    wine
    librsvg
    prismlauncher
  ];
}
