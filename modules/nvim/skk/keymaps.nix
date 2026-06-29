_: {
  programs.nixvim = {
    keymaps = [
      {
        mode = [
          "i"
          "c"
          "t"
        ];
        key = "<C-j>";
        action = "<Plug>(skkeleton-toggle)";
        options.desc = "japanese input";
      }
    ];
  };
}
