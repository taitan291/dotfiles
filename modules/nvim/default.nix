{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    nixpkgs.source = pkgs.path;
    filetype = {
      extension = {
        svelte = "svelte";
      };
    };
  };

  imports = [
    ./navigation
    ./utils
    ./ui
    ./lsp
    ./skk
    ./copilot
    ./typst
    ./options.nix
    ./completion.nix
		./sengoku.nix
  ];
}
