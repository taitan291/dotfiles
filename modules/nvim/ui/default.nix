{...}: {
  programs.nixvim = {
    colorschemes.nightfox = {
      enable = true;
      flavor = "nightfox";
    };
    plugins = {
      web-devicons.enable = true;
      lualine.enable = true;
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
          };
        };
      };
    };
  };
  imports = [
    ./keymaps.nix
  ];
}
