{pkgs, ...}: let
  plenary-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "plenary";
    src = builtins.fetchGit {
      url = "https://github.com/nvim-lua/plenary.nvim";
      rev = "50012918b2fc8357b87cff2a7f7f0446e47da174";
    };
    nvimSkipModule = ["plenary.neorocks.init"];
  };
  copilotChat-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "copilotchat";
    src = builtins.fetchGit {
      url = "https://github.com/CopilotC-Nvim/CopilotChat.nvim";
      rev = "1e06be97df058fa0bb4af54659c39918a4999c86";
    };
    dependencies = [
      plenary-nvim
      pkgs.vimPlugins.copilot-lua
    ];
  };
in {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      copilot-lua
      plenary-nvim
      copilotChat-nvim
    ];
  };
  imports = [
    ./settings
    ./keymaps.nix
  ];
}
