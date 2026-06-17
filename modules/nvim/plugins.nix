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
      telescope.enable = true;
      treesitter.enable = true;
      typescript-tools.enable = true;
      yazi = {
        enable = true;
        settings = {
          open_for_directories = false; # ディレクトリを開いたときにyaziを起動
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
					require('lspconfig').ells.setup({
						cmd = { "elisp-ls", "--stdio" },
					filetypes = { "elisp" },
				})
			'';
      };
    };
  };
}
