local M = {
	"mhartington/formatter.nvim",
}

M.opts = function()
	local settings = "plugins.lsp.formatter.settings"
	Util = require("formatter.util")

	return {
		-- Enable or disable logging
		logging = false,
		-- Set the log level
		log_level = vim.log.levels.WARN,
		-- All formatter configurations are opt-in
		filetype = {
			lua = require(settings .. ".lua"),
			rust = require(settings .. ".rust"),
			["*"] = {
				-- "formatter.filetypes.any" defines default configurations for any
				-- filetype
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	}
end

return M
