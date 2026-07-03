zmodload zsh/complist

zstyle ':completion:*:*:(nvim|emacs):*:*' ignored-patterns '*.pdf' '*.lock'
zstyle ':completion:*:*:xdg-open:*:*' ignored-patterns '*.typ'

# Tab変換
zstyle ':completion:*' menu select

# キャッシュを有効にして補完速度を向上（特にパッケージ数が多いNixOSで有効）
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

bindkey -M menuselect '^g' undo

ns() {
  nix shell "$@" -c zsh
}
