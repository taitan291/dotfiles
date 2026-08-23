{host, ...}: let
  rebuildFunc = ''
    rebuild() {
      local action="''${1:-switch}"
      local flake_path

      if [ "${host}" = "wsl" ]; then
        flake_path=".#wsl"
      else
        flake_path="/home/taitan/.config/nixos/.#${host}"
      fi

      sudo nixos-rebuild "$action" --flake "$flake_path"
    }
  '';
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    setOptions = [
      # コマンドの重複の削除、残さない
      "hist_ignore_dups"
      "hist_ignore_all_dups"

      # ミスしたときのういビームの停止
      "no_beep"
    ];
    initContent = (builtins.readFile ./zshrc.zsh) + "\n" + rebuildFunc;
  };
  home = {
    shellAliases = {
      nd = "nix develop -c zsh";
      # rebuild =
      #   if host == "wsl"
      #   then "sudo nixos-rebuild switch --flake .#wsl"
      #   else "sudo nixos-rebuild switch --flake ~/.config/nixos/.#${host}";
    };
  };
}
