local group = vim.api.nvim_create_augroup("FcitxControl", { clear = true })

-- Neovimに入った時
vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
	group = group,
	callback = function()
		vim.fn.jobstart({ "pkill", "fcitx5" }, { detach = true })
	end,
})

-- Neovimから離れた時
vim.api.nvim_create_autocmd({ "VimLeavePre", "FocusLost" }, {
	group = group,
	callback = function()
		vim.fn.jobstart({ "fcitx5", "-d" }, { detach = true })
	end,
})
