{
  config,
  osConfig,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    setOptions = [
      # コマンドの重複の削除、残さない
      "hist_ignore_dups"
      "hist_ignore_all_dups"

      # スペルミスの訂正
      "correct"

      # ミスしたときのういビームの停止
      "no_beep"
    ];
    initContent = builtins.readFile ./zshrc.zsh;
  };
  home = {
    shellAliases = {
      sl = "ls && sl";
      lgit = "lazygit";

      nd = "nix develop -c zsh";

      rebuild =
        if osConfig.networking.hostName == "wsl"
        then "sudo nixos-rebuild switch --flake .#wsl"
        else "sudo nixos-rebuild switch --flake ~/.config/nixos/.#${osConfig.networking.hostName}";
    };
  };
}
