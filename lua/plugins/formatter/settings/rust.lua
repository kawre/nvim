local M = {
	require("formatter.filetypes.rust").rustfmt,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
