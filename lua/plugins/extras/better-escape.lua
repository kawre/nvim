local M = {
	"max397574/better-escape.nvim",
	event = "InsertEnter",
}

M.opts = {
	default_mappings = false,
	mappings = {
		i = { j = { k = "<Esc>" } },
		t = { j = { k = "<C-\\><C-n>" } },
	},
}

return M
