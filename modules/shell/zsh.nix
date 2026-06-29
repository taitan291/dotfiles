_: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      sl = "ls && sl";
      lgit = "lazygit";

      nd = "nix develop -c zsh";
    };
    setOptions = [
      # コマンドの重複の削除、残さない
      "hist_ignore_dups"
      "hist_ignore_all_dups"
      # ヒストリーの共有
      "share_history"

      # スペルミスの訂正
      "correct"

      # ミスしたときのういビームの停止
      "no_beep"
    ];
    initContent = ''
         zmodload zsh/complist

         zstyle ':completion:*:*:(nvim|emacs):*:*' ignored-patterns '*.pdf' '*.lock'
         zstyle ':completion:*:*:xdg-open:*:*' ignored-patterns '*.typ'

      # Tab変換
      zstyle ':completion:*' menu select

      # キャッシュを有効にして補完速度を向上（特にパッケージ数が多いNixOSで有効）
         zstyle ':completion:*' use-cache yes
         zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

      bindkey -M menuselect '^g' undo
    '';
  };
}
