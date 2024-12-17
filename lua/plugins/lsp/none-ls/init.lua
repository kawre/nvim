local M = {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
}

function M.config()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local completion = null_ls.builtins.completion

	null_ls.setup({
		debug = true,
		sources = {
			-- lua
			formatting.stylua,

			-- python
			formatting.black,
			-- diagnostics.mypy,

			-- formatting.prettier,
			formatting.fish_indent,
			diagnostics.djlint,
			formatting.shfmt,
			diagnostics.fish,
			diagnostics.markdownlint,
			completion.spell,
		},
	})
end

return M
