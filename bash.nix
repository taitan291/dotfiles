{...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      sl = "ls && sl";
      lgit = "lazygit";
    };
    profileExtra = ''
      # ログインシェルでも.bashrcを読み込む
      [[ -f ~/.bashrc ]] && source ~/.bashrc
    '';
    bashrcExtra = ''
      editors=(nvim emacs)
      # tab補完
      complete -f -X '*.pdf' "''${editors[@]}"
      complete -f -X '*.lock' "''${editors[@]}"
      complete -f -X '*.typ' xdg-open
    '';
  };
}
