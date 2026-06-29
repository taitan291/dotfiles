_: {
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

      # コピペ
      clipboard = "unnamedplus"; # クイックボードとの同期

      showcmd = true;

      timeout = true;
      timeoutlen = 3000;
    };
  };
}
