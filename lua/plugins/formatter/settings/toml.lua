local M = {
	require("formatter.filetypes.toml").taplo,
}

local opts = {}

return vim.tbl_deep_extend("force", M, opts)
