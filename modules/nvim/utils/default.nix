{pkgs, ...}: let
  tobira = pkgs.vimUtils.buildVimPlugin {
    name = "tobira";
    src = builtins.fetchGit {
      url = "https://github.com/kamegoro/tobira.nvim";
      rev = "cd286ca662703b9d9082704892995565aac9f048";
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
      treesitter.enable = true;
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
