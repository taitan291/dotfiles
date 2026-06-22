{...}: {
  programs.nixvim = {
    plugins = {
			toggleterm = {
				enable = true;
				settings = {
          open_mapping = "[[<C-\\>]]"; 
          direction = "horizontal";
          start_in_insert = true;
					size = 10;
        };
			};
      treesitter.enable = true;
		};
	};
	imports = [
		./keymaps.nix
	];
}
