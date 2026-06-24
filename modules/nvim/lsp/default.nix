{...}: {
  programs.nixvim = {
    plugins = {
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
