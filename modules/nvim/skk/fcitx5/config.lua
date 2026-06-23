vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
  callback = function()
    vim.fn.system("fcitx5-remote -c")
	end,
})

vim.api.nvim_create_autocmd({ "FocusLost", "VimLeavePre" }, {
  callback = function()
      vim.fn.system("fcitx5-remote -o")
  end,
})
