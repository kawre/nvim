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
