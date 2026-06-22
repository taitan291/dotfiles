{...}: {
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      lualine.enable = true;
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "┋";
          };
          scope = {
            enabled = true;
            show_start = false;
          };
        };
      };
      colorizer = {
				enable = true;
				settings = {
					user_default_options = {
						RGB = true;
						RRGGBB = true;
					};
				};
			};
		};
	};
}
