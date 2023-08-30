local M = {
	require("formatter.filetypes.javascriptreact").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
