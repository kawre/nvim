---@module 'neotest'

local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
	},
}

M.opts = {
	--
}

M.config = function(_, opts)
	opts.adapters = {
		--
	}

	require("neotest").setup(opts)
end

M.keys = {
	{
		"<leader>tt",
		function()
			require("neotest").run.run()
		end,
	},
	{
		"<leader>tf",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
	},
}

return M
