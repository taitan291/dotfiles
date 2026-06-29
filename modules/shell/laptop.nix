{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/taitan/.config/nixos/.#laptop";
    };
  };
}
