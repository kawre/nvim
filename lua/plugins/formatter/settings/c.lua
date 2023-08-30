local M = {
	require("formatter.filetypes.c").clangformat,
}

local util = require("formatter.util")

local opts = {
	{
		exe = "clang-format",
		args = {
			'-style="{BasedOnStyle: Microsoft}"',
			"-assume-filename",
			util.escape_path(util.get_current_buffer_file_name()),
		},
		stdin = true,
		try_node_modules = true,
	},
}

return vim.tbl_deep_extend("force", M, opts)
