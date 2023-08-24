local M = {
	"mhartington/formatter.nvim",
}

M.opts = function(_, opts)
	opts.logging = false
	opts.log_level = vim.log.levels.WARN

	local types = {
		["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
	}

	for _, server in pairs(_G.servers) do
		local ok, lang = pcall(require, "plugins.lsp.settings." .. server)
		if ok then
			types[server] = lang.formatter()
		end
	end

	opts.filetype = types
end

return M
