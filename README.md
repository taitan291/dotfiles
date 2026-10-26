# nixos

個人用の NixOS 設定 (Flakes + Home Manager)。

## ホスト

| ホスト | 用途 |
| --- | --- |
| `laptop` | ノートPC |
| `desktop` | デスクトップ (NVIDIA) |
| `wsl` | WSL |

## 構成

```
flake.nix        # エントリポイント (flake-parts)
host/
  common-modules/  # 全ホスト共通のシステム設定
  <host>/          # ホスト固有の configuration / home / modules
modules/         # Home Manager モジュール
```

## 使用ソフト

| カテゴリ | ソフト |
| --- | --- |
| WM / デスクトップ | Hyprland (Hyprlock, Hyprshot, Hyprspace), dunst, SwayOSD, SDDM (uindows テーマ), Bibata カーソル |
| ターミナル / シェル | Ghostty (Catppuccin Mocha), zsh, Starship |
| エディタ | Neovim (nixvim), Emacs (twist.nix) |
| 日本語入力 | fcitx5 + SKK, skkeleton, rskk |
| ファイラ | Yazi, Thunar |
| Git 関連 | Git, Jujutsu, GitHub CLI |
| AI | Claude Code, Codex, assistant-ui |
| ブラウザ / 通信 | Brave, Discord |
| ユーティリティ | Bitwarden, fastfetch, btop, Mission Center, Wine, Prism Launcher |
| オーディオ | PipeWire (WirePlumber), pavucontrol, playerctl, qpwgraph, wiremix |
| フォント | M PLUS 1 Code, JetBrains Mono, Noto CJK |
| 開発ツール | treefmt-nix, git-hooks.nix |

Neovim の LSP: nixd, lua_ls, pyright, clangd, gopls, Astro, Svelte, Tailwind CSS, HTML/CSS/JSON, ESLint, typescript-tools

# 依存の更新
nix flake update

# フォーマット
nix fmt

## ライセンス

[Everyone'sWare](LICENSE)
