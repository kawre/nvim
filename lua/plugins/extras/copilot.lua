local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	dependencies = "AndreM222/copilot-lualine",
}

M.opts = {
	panel = {
		keymap = {
			jump_next = "<c-j>",
			jump_prev = "<c-k>",
			accept = "<c-l>",
			refresh = "r",
			open = "<M-CR>",
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<c-l>",
			next = "<c-j>",
			prev = "<c-k>",
			dismiss = "<c-h>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = true,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["leetcode.nvim"] = false,
		["."] = false,
	},
	copilot_node_command = "node",
}

function M.config(_, opts)
	require("copilot").setup(opts)

	vim.api.nvim_set_keymap(
		"n",
		"<c-s>",
		":lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
		{ noremap = true, silent = true }
	)

	-- require("copilot_cmp").setup()
end

return M
