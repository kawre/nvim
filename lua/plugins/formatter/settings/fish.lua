local M = {
	require("formatter.filetypes.fish").fishindent,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
