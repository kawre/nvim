local M = {
	-- require("formatter.filetypes.any").remove_trailing_whitespace,
}

local opts = {}

return {
	function()
		local utils = require("formatter.util")
		local formatters = utils.get_available_formatters_for_ft(vim.bo.filetype)

		for _, value in ipairs(formatters) do
			print(#value)
		end

		vim.lsp.buf.format()
	end,
}
