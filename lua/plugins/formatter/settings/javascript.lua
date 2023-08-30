local M = {
	require("formatter.filetypes.javascript").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
