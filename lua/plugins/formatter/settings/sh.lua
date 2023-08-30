local M = {
	require("formatter.filetypes.sh").shfmt,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
