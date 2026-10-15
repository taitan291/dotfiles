{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    # extraPlugins = with pkgs.vimPlugins; [
    #   tobira
    # ];
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
        settings = {
          ensure_installed = ["svelte" "html" "css" "javascript" "typescript"];
          highlight.enable = true;
        };
        grammarPackages = [
          config.programs.nixvim.plugins.treesitter.package.builtGrammars.svelte
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
      yanky = {
        enable = true;
        settings = {
          highlight = {
            on_yank = true;
            timer = 200;
          };
        };
      };
      image = {
        enable = true;
        settings = {
          backend = "kitty";
          max_width = 100;
          max_height = 12;
          max_width_window_percentage.__raw = "math.huge";
          max_height_window_percentage.__raw = "math.huge";
          window_overlap_clear_enabled = true;
        };
      };
    };
  };
  imports = [
    ./keymaps.nix

    ./unicode
    # ./tobira
  ];
}
