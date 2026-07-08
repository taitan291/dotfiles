{
  programs.nixvim = {
    keymaps = [
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "ターミナルモードからノーマルモードへ戻る";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Leader>o";
        action = "m`o<Esc>``";
        options = {
          desc = "Insert newline below without moving cursor";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Leader>O";
        action = "m`O<Esc>``";
        options = {
          desc = "Insert newline above without moving cursor";
          silent = true;
        };
      }
    ];
  };
}
