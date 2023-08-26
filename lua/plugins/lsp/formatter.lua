local M = {
	"mhartington/formatter.nvim",
}

M.opts = function(_, opts)
	local util = require("formatter.util")

	local types = {
		["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
		fish = require("plugins.lsp.settings.fish").formatter(util),
	}

	for lang, _ in pairs(_G.servers) do
		local ok, config = pcall(require, "plugins.lsp.settings." .. lang)
		if ok then
			for _, filetype in ipairs(config.filetypes) do
				types[filetype] = config.formatter(util)
			end
		end
	end

	opts.logging = false
	opts.log_level = vim.log.levels.WARN
	opts.filetype = types
end

return M
