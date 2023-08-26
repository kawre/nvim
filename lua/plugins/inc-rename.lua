local M = {
	"smjonas/inc-rename.nvim",
	cmd = "IncRename",
}

M.keys = {
	{ "<leader>rn", ":IncRename ", desc = "Rename" },
}

M.opts = {}

return M
