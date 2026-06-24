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
        key = "<leader>yy"; # カレントワーキングディレクトリで開く
        action = "<cmd>Yazi cwd<cr>";
        options.desc = "Open Yazi in CWD";
      }
      {
        mode = "n";
        key = "<leader>ff"; # Find Files (ファイル名検索)
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Telescope Find Files";
      }
      {
        mode = "n";
        key = "<leader>fg"; # Find Grep (プロジェクト内の全文検索)
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Telescope Live Grep";
      }
      {
        mode = "n";
        key = "<leader>bb"; # Buffers (開いているバッファの検索)
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Telescope Buffers";
      }
      {
        mode = "n";
        key = "<leader>fb"; # File Browser (ファイルマネージャーの起動)
        action = "<cmd>Telescope file_browser<CR>";
        options.desc = "Telescope File Browser";
      }
      {
        mode = "n";
        key = "<leader>fo";
        action = "<cmd>Oil<CR>";
        options = {
          desc = "Oil（ファイルマネージャ）を開く";
        };
      }
    ];
  };
}
