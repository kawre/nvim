local M = {
	require("formatter.filetypes.lua").stylua,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
