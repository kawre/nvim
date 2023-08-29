local M = { filetypes = { "java" } }

function M.formatter(util)
	return {
		{
			exe = "clang-format",
			args = {
				'-style="{BasedOnStyle: Google, IndentWidth: 4}"',
				"--assume-filename=.java",
			},
			stdin = true,
		},
	}
end

return M
