local user = require("config.user")

local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"noice.nvim",
		"nvim-web-devicons",
	},
	lazy = false,
}

local cat = require("lualine.themes.catppuccin")

cat = vim.tbl_deep_extend("force", cat, {
	normal = {
		c = {
			bg = "#11111c",
			fg = "#7f849d",
		},
	},
	inactive = {
		c = {
			bg = "#11111c",
			fg = "#7f849d",
		},
	},
})

M.opts = {
	options = {
		theme = cat,
		component_separators = "",
		section_separators = { left = "", right = "" },
		icons_enabled = true,
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {
				"lazy",
				"NvimTree",
				"alpha",
				"help",
				"neo-tree",
				"neogitstatus",
				"leetcode.nvim",
			},
		},
		ignore_focus = {
			"lazy",
			"NvimTree",
			"alpha",
			"help",
			"neo-tree",
			"neogitstatus",
			"leetcode.nvim",
		},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { right = "" }, right_padding = 4 },
		},
		lualine_b = {},
		lualine_c = {
			{ "branch", icon = "", color = { fg = "#cba6f8" } },
			{ "filename" },
			{
				"diagnostics",
				symbols = {
					error = user.signs.error .. " ",
					warn = user.signs.warn .. " ",
					info = user.signs.info .. " ",
					hint = user.signs.hint .. " ",
				},
			},
		},
		lualine_x = {
			{
				function()
					if package.loaded["leetcode"] then
						local ok, text = pcall(function()
							return require("leetcode.config").auth.name
						end)
						return ok and ("leetcode: " .. text) or ""
					end

					return ""
				end,
			},
			{ "copilot" },
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = { fg = "#ff9e64" },
			},
			{
				"filesize",
				color = { fg = "#6c7087" },
			},
			{
				"location",
				color = { fg = "#89b4fb" },
				-- separator = { right = "" },
				-- left_padding = 2,
			},
			"progress",
		},
		lualine_y = {},
		lualine_z = {
			{
				"fileformat",
				color = { bg = "#181826", fg = "#cdd6f5" },
			},
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
}

M.config = function(_, opts)
	table.insert(opts.sections.lualine_x, Snacks.profiler.status())
	require("lualine").setup(opts)
end

return M
