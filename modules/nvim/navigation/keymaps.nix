{...}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>yy";
        action = "<cmd>Yazi<cr>";
        options.desc = "Open Yazi at current file";
      }
      {
        mode = "n";
        key = "<leader>cy"; # カレントワーキングディレクトリで開く
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
      {
        mode = "n";
        key = "<A-h>";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          desc = "Toggle Neo-tree sidebar";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>es";
        action = ":split ";
        options = {
          desc = "ファイルを指定して横分割";
        };
      }
      {
        mode = "n";
        key = "<leader>ev";
        action = ":vsplit ";
        options = {
          desc = "ファイルを指定して横分割";
        };
      }
      {
        mode = "n";
        key = "<leader>ns";
        action = "<cmd>new<cr>";
        options = {
          desc = "新規ファイルを横分割で開く";
        };
      }
      {
        mode = "n";
        key = "<leader>nv";
        action = "<cmd>vnew<cr>";
        options = {
          desc = "新規ファイルを縦分割で開く";
        };
      }
    ];
  };
}
