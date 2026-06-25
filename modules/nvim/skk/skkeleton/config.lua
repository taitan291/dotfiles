vim.api.nvim_create_autocmd("User", {
	pattern = "skkeleton-initialize-pre",
	callback = function()
		vim.fn["skkeleton#config"]({
			globalDictionaries = { vim.g.skk_dict_path, "euc-jp" },
			eggLikeNewline = true,
		})
		vim.fn["ddc#custom#patch_global"]("ui", "native")
		vim.fn["ddc#custom#patch_global"]("sources", { "skkeleton" })
		vim.fn["ddc#custom#patch_global"]({
			sourceOptions = {
				["skkeleton"] = {
					mark = "skkeleton",
					matchers = {},
					sorters = {},
					converters = {},
					isVolatile = true,
					minAutoCompleteLength = 1,
				},
			},
		})
		vim.fn["ddc#enable"]()
	end,
})
