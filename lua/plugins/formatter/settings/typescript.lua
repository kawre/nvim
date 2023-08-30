local M = {
	require("formatter.filetypes.typescript").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
