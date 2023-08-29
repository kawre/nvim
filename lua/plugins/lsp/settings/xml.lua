local M = {
	filetypes = { "xml" },
}

function M.formatter(util)
	return {
		require("formatter.filetypes.xml").rustfmt,

		function()
			return {}
		end,
	}
end

function M.settings()
	return {}
end

return M
