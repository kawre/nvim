local M = {}

function M.formatter()
	local util = require("formatter.util")

	return {
		require("formatter.filetypes.lua").stylua,
		function()
			return {
				exe = "stylua",
				args = {
					"--search-parent-directories",
					"--stdin-filepath",
					util.escape_path(util.get_current_buffer_file_path()),
					"--",
					"-",
				},
				stdin = true,
			}
		end,
	}
end

function M.settings()
	return {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}
end

return M
