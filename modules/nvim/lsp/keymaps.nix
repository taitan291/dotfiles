{pkgs, ...}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>tp";
        action = "<cmd>TypstPreview<CR>";
        options.desc = "Typst Preview Start";
      }
      {
        mode = "n";
        key = "<leader>ts";
        action = "<cmd>TypstPreviewStop<CR>";
        options.desc = "Typst Preview Stop";
      }
    ];
    plugins.lsp = {
      keymaps = {
        diagnostic = {
          "<leader>e" = "open_float";
          "[d" = "goto_prev";
          "]d" = "goto_next";
          "<leader>q" = "setloclist";
        };
      };
    };
  };
}
