local M = {
	filetypes = { "c", "cpp" },
}

function M.formatter(util)
	return {
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
end

function M.settings()
	return {}
end

return M
