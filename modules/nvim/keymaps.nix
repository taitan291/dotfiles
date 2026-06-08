{...}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>y"; # 任意のキー（例: Leader + y）
        action = "<cmd>Yazi<cr>";
        options.desc = "Open Yazi at current file";
      }
      {
        mode = "n";
        key = "<leader>cw"; # カレントワーキングディレクトリで開く
        action = "<cmd>Yazi cwd<cr>";
        options.desc = "Open Yazi in CWD";
      }
    ];
  };
}
