{...}: {
  programs.nixvim = {
    plugins = {
      telescope = {
				enable = true;
				settings = {
					defaults = {
						file_ignore_patterns = [
							"^.git/"
							"^.mypy_cache/"
							"^__pycache__/"
							"^output/"
							"^data/"
							"%.ipynb"
						];
						layout_config = {
							prompt_position = "top";
						};
						mappings = {
							i = {
								"<A-J>" = "move_selection_next";
								"<A-K>" = "move_selection_previous";
							};
						};
						selection_caret = "> ";
						set_env = {
							COLORTERM = "truecolor";
						};
						sorting_strategy = "ascending";
					};
				};
				extensions = {
					fzf-native.enable = true;
					file-browser.enable = true;
					ui-select.enable = true;
				};
			};
			oil = {
        enable = true;
        settings = {
          default_file_explorer = true;
          view_options = {
            show_hidden = true;
          };
        };
      };
      yazi = {
        enable = true;
        settings = {
          open_for_directories = false;
        };
      };
		};
	};
	imports = [
		./keymap.nix
	];
}

