-- Make Unicode format/control characters visible while editing.
-- This is intentionally limited to characters which are normally invisible
-- or can change the apparent reading order of source code.
local namespace = vim.api.nvim_create_namespace("unicode_security")

local suspicious = {
	[0x00AD] = "SHY", -- soft hyphen
	[0x061C] = "ALM", -- Arabic letter mark
	[0x180E] = "MVS", -- Mongolian vowel separator
	[0x200B] = "ZWSP", -- zero-width space
	[0x200C] = "ZWNJ", -- zero-width non-joiner
	[0x200D] = "ZWJ", -- zero-width joiner
	[0x200E] = "LRM", -- left-to-right mark
	[0x200F] = "RLM", -- right-to-left mark
	[0x202A] = "LRE", -- bidi embedding
	[0x202B] = "RLE",
	[0x202C] = "PDF", -- pop directional formatting
	[0x202D] = "LRO", -- bidi override
	[0x202E] = "RLO", -- bidi override (commonly abused)
	[0x2060] = "WJ", -- word joiner
	[0x2061] = "FA", -- function application
	[0x2062] = "IT", -- invisible times
	[0x2063] = "IS", -- invisible separator
	[0x2064] = "IP", -- invisible plus
	[0x2066] = "LRI", -- bidi isolate
	[0x2067] = "RLI",
	[0x2068] = "FSI",
	[0x2069] = "PDI",
	[0xFEFF] = "BOM", -- zero-width no-break space / BOM
}

vim.api.nvim_set_hl(0, "UnicodeSecurityWarning", {
	bg = "#5f0000",
	fg = "#ffffff",
	bold = true,
})

local function refresh(bufnr)
	if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end

	vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

	for row, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
		local ok = pcall(function()
			for byte_col, codepoint in utf8.codes(line) do
				local label = suspicious[codepoint]
				if label then
					vim.api.nvim_buf_set_extmark(bufnr, namespace, row - 1, byte_col - 1, {
						virt_text = { { "⟦" .. label .. "⟧", "UnicodeSecurityWarning" } },
						virt_text_pos = "overlay",
						priority = 200,
					})
				end
			end
		end)

		-- Do not make an invalidly encoded buffer unusable; the normal editor
		-- display remains available if UTF-8 decoding fails.
		if not ok then
			break
		end
	end
end

vim.api.nvim_create_autocmd({
	"BufEnter",
	"BufWinEnter",
	"TextChanged",
	"TextChangedI",
	"BufWritePost",
}, {
	group = vim.api.nvim_create_augroup("unicode_security", { clear = true }),
	callback = function(args)
		refresh(args.buf)
	end,
})
