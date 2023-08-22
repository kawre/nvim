local M = {
	"smjonas/inc-rename.nvim",
	cmd = "IncRename",
}

M.opts = {}

M.init = function()
	vim.keymap.set("n", "<leader>rn", function()
		return ":IncRename " .. vim.fn.expand("<cword>")
	end, { expr = true })
end

return M
