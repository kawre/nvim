local M = {
	require("formatter.filetypes.python").black,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
