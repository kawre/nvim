local M = { filetypes = { "fish" } }

function M.formatter(util)
	return {
		require("formatter.filetypes.fish").fishindent,

		function()
			return {}
		end,
	}
end

-- function M.settings()
-- 	return nil
-- end

return M
