local M = {
	require("formatter.filetypes.html").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
