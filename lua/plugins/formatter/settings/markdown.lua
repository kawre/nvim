local M = {
	require("formatter.filetypes.markdown").prettier,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
