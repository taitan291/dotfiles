{
  programs.nixvim = {
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
