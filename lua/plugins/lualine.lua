local M = {
	"nvim-lualine/lualine.nvim",
}

M.opts = {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"lazy",
			"NvimTree",
			"neo-tree",
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				symbols = {
					modified = _G.symbols.modified,
					readonly = _G.symbols.readonly,
					newfile = _G.symbols.newfile,
					unnamed = _G.symbols.unnamed,
				},
			},
		},
		lualine_x = {
			{
				"diagnostics",
				symbols = {
					error = _G.signs.error .. " ",
					warn = _G.signs.warn .. " ",
					info = _G.signs.info .. " ",
					hint = _G.signs.hint .. " ",
				},
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

return M
