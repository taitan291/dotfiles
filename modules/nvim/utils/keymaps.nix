{...}: {
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
    ];
  };
}
