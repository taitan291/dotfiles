{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    nixpkgs.source = pkgs.path;
  };

  imports = [
    ./navigation
    ./utils
    ./ui
    ./lsp
    ./skk
    ./copilot
    ./options.nix
    ./completion.nix
  ];
}
