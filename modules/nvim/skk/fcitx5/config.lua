local group = vim.api.nvim_create_augroup("FcitxControl", { clear = true })

-- Neovim起動前にfcitx5が動いていたか
local fcitx5_was_running = false

-- Neovimに入った時
vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	callback = function()
		vim.fn.system({ "pgrep", "-f", "^[^ ]*fcitx5( |$)" })
		fcitx5_was_running = vim.v.shell_error == 0
		if fcitx5_was_running then
			vim.fn.system({ "pkill", "-f", "^[^ ]*fcitx5( |$)" })
		end
	end,
})

-- Neovimから離れた時(元々起動していた場合のみ復帰する)
vim.api.nvim_create_autocmd("VimLeave", {
	group = group,
	callback = function()
		if fcitx5_was_running then
			vim.fn.jobstart({ "fcitx5", "-d" }, { detach = true })
		end
	end,
})
