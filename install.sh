#!/usr/bin/env bash
set -e

# 1. 過去のバックアップファイルを削除
sudo rm -f /etc/bash.bashrc.backup-before-nix
sudo rm -f /etc/zsh/zshrc.backup-before-nix

# 2. 既存の /nix ディレクトリが存在する場合、所有権を codespace に変更（または削除して再作成）
if [ -d "/nix" ]; then
    sudo chown -R "$(whoami)" /nix
fi

if ! command -v nix &> /dev/null; then
    # シングルユーザーモードでインストール
    curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
    
    if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
        source "$HOME/.nix-profile/etc/profile.d/nix.sh"
    fi
fi

mkdir -p ~/.config/nix
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
fi

echo "Nix installation complete!"

nix run home-manager -- switch --flake .#code
