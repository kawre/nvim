local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
}

M.init = function()
	vim.cmd.colorscheme("catppuccin")
end

M.opts = {
	integrations = {
		alpha = true,
		cmp = true,
		flash = true,
		gitsigns = true,
		illuminate = true,
		indent_blankline = { enabled = true },
		lsp_trouble = true,
		mason = true,
		mini = true,
		barbecue = {
			dim_dirname = true, -- directory name is dimmed by default
			bold_basename = true,
			dim_context = true,
			alt_background = false,
		},
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		-- navic = { enabled = true, custom_bg = "lualine" },
		neotest = true,
		noice = true,
		notify = true,
		neotree = true,
		semantic_tokens = true,
		telescope = true,
		treesitter = true,
		blink_cmp = true,
		which_key = true,
		fzf = true,
		dropbar = { enabled = true, color_mode = true },
		snacks = true,
	},
	custom_highlights = function(colors)
		return {
			DropBarKindFile = { fg = colors.text },
			LuasnipUnvisited = { bg = colors.surface1 },
			LuasnipActiveIcon = { fg = colors.peach },
			LspInlayHint = { bg = colors.surface0 },
			SnacksIndent = { fg = colors.surface0 },
		}
	end,
}

return M
