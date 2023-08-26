local M = {
	filetypes = { "lua" },
}

function M.formatter(util)
	return {
		require("formatter.filetypes.lua").stylua,

		function()
			return {}
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
