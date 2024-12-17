local M = {
	"gbprod/yanky.nvim",
	event = "LazyFile",
}

M.keys = {
	{ "<C-p>", mode = { "n" }, "<Plug>(YankyCycleBackward)" },
	{ "<C-n>", mode = { "n" }, "<Plug>(YankyCycleForward)" },
	{ "p", mode = { "n", "x" }, "<Plug>(YankyPutAfter)" },
	{ "P", mode = { "n", "x" }, "<Plug>(YankyPutBefore)" },
	{ "gp", mode = { "n", "x" }, "<Plug>(YankyGPutAfter)" },
	{ "gP", mode = { "n", "x" }, "<Plug>(YankyGPutBefore)" },
	{ "y", mode = { "n", "x" }, "<Plug>(YankyYank)" },
}

M.opts = {
	highlight = {
		timer = 250,
	},
}

return M
