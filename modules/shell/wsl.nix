_: {
  programs.zsh = {
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/taitan/.config/nixos/.#wsl";
    };
  };
}
