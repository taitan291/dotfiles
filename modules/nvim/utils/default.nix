{
  config,
  pkgs,
  ...
}: {
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
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = ["svelte" "html" "css" "javascript" "typescript" "typst"];
          highlight.enable = true;
        };
        grammarPackages = [
          config.programs.nixvim.plugins.treesitter.package.builtGrammars.svelte
          config.programs.nixvim.plugins.treesitter.package.builtGrammars.typst
        ];
      };
      treesitter-context = {
        enable = true;
        settings = {
          line_numbers = true;
          max_lines = 3;
          min_window_height = 0;
          mode = "cursor";
          multiline_threshold = 20;
          separator = "-";
          trim_scope = "outer";
          zindex = 20;
        };
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
      zen-mode = {
        enable = true;
        settings = {
          window = {
            backdrop = 0.95;
            width = 120;
            height = 1;
            options = {
              signcolumn = "no";
              number = false;
              relativenumber = false;
              cursorline = false;
              foldcolumn = "0";
              list = false;
            };
          };
          plugins = {
            options = {
              enabled = true;
              ruler = false;
              showcmd = false;
            };
            gitsigns.enabled = false;
            tmux.enabled = false;
            twilight.enabled = false;
          };
          on_open = ''
            function(win)
              vim.opt.relativenumber = false
            end
          '';
          on_close = ''
            function(win)
              vim.opt.relativenumber = true
            end
          '';
        };
      };
      nvim-ufo = {
        enable = true;
        settings = {
          provider_selector = ''
            function(bufnr, filetype, buftype)
              return { "treesitter", "indent" }
            end
          '';
          open_fold_hl_timeout = 150;
        };
      };
    };
  };
  imports = [
    ./keymaps.nix

    ./unicode
    ./jk
    # ./tobira
  ];
}
