local M = {
	require("formatter.filetypes.css").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
