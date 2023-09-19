local M = {
	filetypes = { "lua" },
}

M.config = {
	require("efmls-configs.formatters.stylua"),
}

return M
