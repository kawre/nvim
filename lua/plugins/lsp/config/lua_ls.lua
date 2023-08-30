local M = {
	filetypes = { "lua" },
}

M.setup = function()
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
