local M = {
	"HiPhish/rainbow-delimiters.nvim",
	event = "LazyFile",
	enabled = true,
}

M.config = function()
	local rainbow = require("rainbow-delimiters")

	vim.cmd("highlight RainbowDelimiterRed guifg=#ffd700")
	vim.cmd("highlight RainbowDelimiterYellow guifg=#da70d6")
	vim.cmd("highlight RainbowDelimiterBlue guifg=#179fff")

	vim.g.rainbow_delimiters = {
		strategy = {
			[""] = rainbow.strategy["global"],
			vim = rainbow.strategy["local"],
		},
		query = {
			[""] = "rainbow-delimiters",
			-- lua = "rainbow-blocks",
		},
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
		},
		priority = {
			java = 200,
		},
	}
end

return M
