local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		theme = "auto",
		component_separators = { "", "" },
		section_separators = { "", "" },
	},
	sections = {
		lualine_a = { "filename" },
		lualine_b = { "branch", { "diff" } },
		lualine_c = {},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = {},
		lualine_z = { "location" },
	},
})
