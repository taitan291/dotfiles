{...}: {
  programs.nixvim = {
    keymaps = [
			{
				mode = "t";
				key = "<Esc><Esc>"; # 好みに応じて "jk" や "<C-[>" に変更してください
				action = "<C-\\><C-n>";
				options = {
					desc = "ターミナルモードからノーマルモードへ戻る";
					silent = true;
				};
			}
    ];
  };
}
