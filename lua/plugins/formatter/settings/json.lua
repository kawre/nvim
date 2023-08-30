local M = {
	require("formatter.filetypes.json").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
