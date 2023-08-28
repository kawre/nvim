local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"folke/noice.nvim",
		"nvim-tree/nvim-web-devicons",
	},
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
			"alpha",
			"help",
			"neo-tree",
			"neogitstatus",
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
		lualine_a = {
			{ "mode", right_padding = 2 },
		},
		lualine_b = { "branch" },
		lualine_c = {
			-- {
			-- 	"filename",
			-- 	icon_only = true,
			-- 	symbols = {
			-- 		modified = _G.symbols.modified,
			-- 		readonly = _G.symbols.readonly,
			-- 		newfile = _G.symbols.newfile,
			-- 		unnamed = _G.symbols.unnamed,
			-- 	},
			-- },
			"filetype",
			{
				"diagnostics",
				symbols = {
					error = _G.signs.error .. " ",
					warn = _G.signs.warn .. " ",
					info = _G.signs.info .. " ",
					hint = _G.signs.hint .. " ",
				},
			},
		},
		lualine_x = {
			-- {
			-- 	"diagnostics",
			-- 	symbols = {
			-- 		error = _G.signs.error .. " ",
			-- 		warn = _G.signs.warn .. " ",
			-- 		info = _G.signs.info .. " ",
			-- 		hint = _G.signs.hint .. " ",
			-- 	},
			-- },
			"encoding",
			"fileformat",
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
