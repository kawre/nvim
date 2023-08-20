local M = {}

function M.formatter()
	return {
		require("formatter.filetypes.rust").rustfmt,

		function()
			return {
				exe = "rustfmt",
				args = { "--edition 2021" },
				stdin = true,
			}
		end,
	}
end

function M.settings()
	return {}
end

return M
