local M = { "lukas-reineke/indent-blankline.nvim" }

M.init = function()
	-- vim.opt.listchars:append("space:⋅")
	-- vim.opt.listchars:append("eol:↴")
end

M.opts = {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}

return M
