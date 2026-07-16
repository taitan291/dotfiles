_: {
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
  };
}
