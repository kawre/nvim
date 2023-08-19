return {
	-- "formatter.filetypes.lua" defines default configurations for the
	-- "lua" filetype
	require("formatter.filetypes.lua").stylua,

	-- You can also define your own configuration
	function()
		-- Supports conditional formatting
		if Util.get_current_buffer_file_name() == "special.lua" then
			return nil
		end

		-- Full specification of configurations is down below and in Vim help
		-- files
		return {
			exe = "stylua",
			args = {
				"--search-parent-directories",
				"--stdin-filepath",
				Util.escape_path(Util.get_current_buffer_file_path()),
				"--",
				"-",
			},
			stdin = true,
		}
	end,
}
