{pkgs, ...}: 
{
  programs.nixvim = {
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
		nixpkgs.source = pkgs.path;

    colorschemes.nightfox = {
      enable = true;
      flavor = "nightfox";
    };
  };

  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
  ];
}
