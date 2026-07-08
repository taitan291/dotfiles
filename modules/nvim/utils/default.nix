{pkgs, ...}: let
  tobira = pkgs.vimUtils.buildVimPlugin {
    name = "tobira";
    src = builtins.fetchGit {
      url = "https://github.com/kamegoro/tobira.nvim";
      rev = "f5b17a928544b0cf84100d3b5f889f4a781f93d6";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      tobira
    ];
    plugins = {
      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<C-\\>]]";
          direction = "horizontal";
          start_in_insert = true;
          size = 10;
        };
      };
      treesitter = {
        enable = true;
        settings.ensure_installed = ["svelte" "html" "css" "javascript" "typescript"];
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          svelte
        ];
      };
      mini = {
        enable = true;
        modules = {
          surround = {
            mappings = {
              add = "sa";
              delete = "sd";
              find = "sf";
              find_left = "sF";
              highlight = "sh";
              replace = "sr";
              update_n_lines = "sn";
            };
          };
        };
      };
    };
  };
  imports = [
    ./keymaps.nix

    ./tobira
  ];
}
