{...}: {
  programs.nixvim = {
    opts = {
      # 行
      number = true; # 行番号表示
      relativenumber = true; # 相対行番号

      # 検索
      smartcase = true; # 大文字がは入力に含まれるときのみ区別

      # tabの空白
      tabstop = 2; # tab文字の表示幅
      softtabstop = 2; # tabの空白の数
      shiftwidth = 2; # 自動インシデントの空白数
      expandtab = true; # タブ文字でなく空白を入れる

      # コピペ
      clipboard = "unnamedplus"; # クイックボードとの同期

      showcmd = true;

      timeout = true;
      timeoutlen = 3000;
      undofile = true; # undo履歴をファイルに保存し、再起動後もundoできる
      updatetime = 250;

      # 見た目
      termguicolors = true; # 24bitカラー(True Color)を有効にする
      signcolumn = "yes"; # 診断表示で画面がガタつかないよう、サイン列を常に表示する
      cursorline = true; # カーソルのある行をハイライトする
      scrolloff = 6; # カーソルの上下に最低n行の余白を残してスクロールする
    };
    globals.mapleader = " ";
  };
}
