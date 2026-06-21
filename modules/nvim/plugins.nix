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
          open_for_directories = false; # ディレクトリを開いたときにyaziを起動
        };
      };
			toggleterm = {
				enable = true;
				settings = {
          open_mapping = "[[<C-\\>]]"; 
          direction = "horizontal";
          start_in_insert = true;
					size = 10;
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
      treesitter.enable = true;
      typescript-tools.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true; # Nix用
          lua_ls.enable = true; # Lua用
          pyright.enable = true; # Python用
          clangd.enable = true; # C/C++用
          astro.enable = true; # Astro用

          # vscode-langservers-extracted
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          eslint.enable = true;

          # rust-analyzer
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };

          # typst
          tinymist = {
            enable = true;
            settings = {
              exportPdf = "onSave";
              formatterMode = "typstyle";
              preview = {
                exportPdf = "onSave";
                refresh = "onSave";
                http = "127.0.0.1:23333";
              };
            };
          };
        };
				postConfig = ''
				local lspconfig = require('lspconfig')
				local configs = require('lspconfig.configs')

				if not configs.ells then
					configs.ells = {
						default_config = {
							cmd = { "elisp-ls", "--stdio" },
							filetypes = { "elisp" },
							root_dir = lspconfig.util.root_pattern(".git", "."),
							settings = {},
						},
					}
				end

				lspconfig.ells.setup({})
				'';
      };
    };
  };
}
