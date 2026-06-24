{ pkgs, lib, ... }:

{
  home.activation.cloneFcitx5Repo = lib.hm.dag.entryAfter ["writeBoundary"] ''
    FCITX_DIR="$HOME/.config/fcitx5"
    REPO_URL="https://github.com/Taitan291/dotfcitx5.git" 

    if [ ! -d "$FCITX_DIR/.git" ]; then
      if [ -d "$FCITX_DIR" ]; then
        mv "$FCITX_DIR" "$HOME/.config/fcitx5.bak.$(date +%s)"
      fi
      ${pkgs.git}/bin/git clone "$REPO_URL" "$FCITX_DIR"
    fi
  '';
}
