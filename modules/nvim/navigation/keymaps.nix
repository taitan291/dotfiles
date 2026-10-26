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
    ];
    plugins = {
      hydra = {
        enable = true;
        hydras = [
          {
            name = "Window";
            mode = "n";
            body = "<leader>w";

            config = {
              invoke_on_body = true;
              hint.type = "window";
            };

            # heads は [ キー 実行内容 オプション ] のリスト
            heads = [
              # 移動
              ["h" {__raw = "function() require('smart-splits').move_cursor_left() end";}]
              ["j" {__raw = "function() require('smart-splits').move_cursor_down() end";}]
              ["k" {__raw = "function() require('smart-splits').move_cursor_up() end";}]
              ["l" {__raw = "function() require('smart-splits').move_cursor_right() end";}]

              # リサイズ
              ["H" {__raw = "function() require('smart-splits').resize_left() end";}]
              ["J" {__raw = "function() require('smart-splits').resize_down() end";}]
              ["K" {__raw = "function() require('smart-splits').resize_up() end";}]
              ["L" {__raw = "function() require('smart-splits').resize_right() end";}]

              # 分割・整理
              ["v" "<C-w>v"]
              ["s" "<C-w>s"]
              ["n" "<cmd>new<cr>"]
              ["N" "<cmd>vnew<cr>"]
              ["=" "<C-w>="]
              ["q" "<cmd>close<cr>"]

              # 入れ替え
              ["m" "<cmd>WinShift<cr>"] # 入れ替えモード
              ["x" "<cmd>WinShift swap<cr>"] # 入れ替え

              # モードを抜ける
              ["<Esc>" null {exit = true;}]
            ];
          }
        ];
        settings = {
          exit = false; # ヘッドを押してもモードを抜けない(標準)
          timeout = false; # 時間で自動的に抜けない
        };
      };
    };
  };
}
