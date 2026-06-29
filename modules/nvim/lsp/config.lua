local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

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
