{...}: {
  programs.nixvim = {
    colorschemes.nightfox = {
      enable = true;
      flavor = "nightfox";
    };
    plugins = {
      web-devicons.enable = true;
      lualine = {
        enable = true;
        settings = {
          winbar = {
            lualine_c = [
              {
                __unkeyed-1 = "filename";
                path = 1; # 0=名前のみ、1=相対パス、2=絶対パス
                symbols = {
                  modified = "●";
                  readonly = "";
                  unnamed = "[No Name]";
                };
              }
            ];
          };
          inactive_winbar = {
            lualine_c = [
              {
                __unkeyed-1 = "filename";
                path = 1;
                symbols = {
                  modified = "●";
                  readonly = "";
                  unnamed = "[No Name]";
                };
              }
            ];
          };
          # サイドバー等では winbar を出さない
          options.disabled_filetypes.winbar = ["neo-tree" "oil" "help" "qf"];
        };
      };
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "┋";
          };
          scope = {
            enabled = true;
            show_start = false;
          };
        };
      };
      colorizer = {
        enable = true;
        settings = {
          user_default_options = {
            RGB = true;
            RRGGBB = true;
          };
        };
      };
      bufferline = {
        enable = true;
        settings = {
          options = {
            mode = "buffers"; # バッファをタブとして表示
            always_show_bufferline = true;
            diagnostics = "nvim_lsp"; # LSPのエラー等があればアイコンで通知
            separator_style = "thin"; # 見た目の区切り線スタイル
            show_buffer_close_icons = false;
            show_close_icon = false;
            # neo-tree の上にバッファラインが被らないようにする
            offsets = [
              {
                filetype = "neo-tree";
                text = "Explorer";
                text_align = "center";
                separator = true;
              }
            ];
          };
        };
      };
    };
  };
  imports = [
    ./keymaps.nix
  ];
}
