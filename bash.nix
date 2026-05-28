{...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos/.#laptos";
      sl = "ls && sl";
    };
    profileExtra = ''
      # ログインシェルでも.bashrcを読み込む
      [[ -f ~/.bashrc ]] && source ~/.bashrc
    '';
    bashrcExtra = ''
         # tab補完
         complete -f -X '*.pdf' nvim emacs vim
         complete -f -X '*.typ' xdg-open

      rebuild() {
      	if [ "$1" = "-d" ]; then
      		echo "Running desktop rebuild..."
      		nixos-rebuild switch --flake ~/.config/nixos/.#desktop
      	elif [ "$1" = "-l" ]; then
      		echo "Running laptop rebuild..."
      		nixos-rebuild switch --flake ~/.config/nixos/.#laptop
      	else
      		echo "Usage: rebuild [-d|-l]" >&2
      		return 1
      	fi
      }
    '';
  };
}
