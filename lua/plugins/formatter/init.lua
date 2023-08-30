local Utils = require("config.utils")

local M = {
	"mhartington/formatter.nvim",
}

M.config = function()
	local types = {}

	local filetypes = Utils.scandir("~/.config/nvim/lua/plugins/formatter/settings")
	for _, filetype in ipairs(filetypes) do
		filetype = vim.split(filetype, ".lua")[1]

		types[filetype == "any" and "*" or filetype] = require("plugins.formatter.settings." .. filetype)
	end

	require("formatter").setup({
		logging = false,
		log_level = vim.log.levels.WARN,
		filetype = types,
	})
end

return M
