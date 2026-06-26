{...}: {
  programs.nixvim = {
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
  ];
}
