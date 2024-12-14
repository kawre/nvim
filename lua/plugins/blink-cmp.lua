---@module 'blink.cmp'

local M = {
	"Saghen/blink.cmp",
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = "L3MON4D3/LuaSnip",
	-- version = "v0.*",
	opts_extend = { "sources.default" },
	-- dev = true,
	-- enabled = false,
}

M.opts = {
	keymap = {
		["<CR>"] = { "select_and_accept", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<Up>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
	},

	sources = { default = { "lsp", "snippets", "path", "lazydev" } },
	completion = {
		menu = {
			draw = {
				padding = { 0, 1 },
				gap = 1,
				treesitter = { "lsp" },
			},
		},
	},
}

M.config = function(_, blink)
	local user = require("config.user")
	local tw = require("blink.cmp.completion.windows.render.tailwind")

	blink.appearance = {
		kind_icons = user.kinds,
		nerd_font_variant = "mono",
	}

	local hl_cache = {}
	---@type blink.cmp.DrawComponent
	blink.completion.menu.draw.components = {
		kind_icon = {
			ellipsis = false,
			text = function(ctx)
				return (" %s "):format(ctx.kind_icon)
			end,
			highlight = function(ctx)
				local hl = (tw.get_hl(ctx) or ("BlinkCmpKind" .. ctx.kind))
				local hl_alt = hl .. "Alt"

				if not hl_cache[hl_alt] then
					local xhl = vim.api.nvim_get_hl(0, { name = hl, link = false })
					vim.api.nvim_set_hl(0, hl_alt, {
						fg = xhl.fg,
						bg = "#313244",
					})
				end

				return hl_alt
			end,
		},
	}

	blink.sources.providers = {
		lsp = {
			transform_items = function(_, items)
				-- Remove the "Text" source from lsp autocomplete
				return vim.tbl_filter(function(item)
					return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
				end, items)
			end,
		},
		lazydev = {
			name = "LazyDev",
			module = "lazydev.integrations.blink",
			fallbacks = { "lsp" },
		},
	}

	blink.snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
		active = function(filter)
			if filter and filter.direction then
				return require("luasnip").jumpable(filter.direction)
			end
			return require("luasnip").in_snippet()
		end,
		jump = function(direction)
			require("luasnip").jump(direction)
		end,
	}

	require("blink.cmp").setup(blink)
end

return M
