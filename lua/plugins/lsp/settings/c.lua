local M = {
	filetypes = { "c", "cpp" },
}

function M.formatter(util)
	return {
		require("formatter.filetypes.cpp").clangformat,

		function()
			return {}
		end,
	}
end

function M.settings()
	return {}
end

return M
