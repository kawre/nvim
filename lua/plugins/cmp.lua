local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	version = false,
}

local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰆧",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "󰌗",
	Interface = "",
	Module = "󰅩",
	Property = "",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰊄",
}

local function truncateString(str, maxLen)
	if #str > maxLen then
		return str:sub(1, maxLen - 3) .. "..."
	else
		return str
	end
end

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	local types = require("cmp.types")
	local function deprioritize_snippet(entry1, entry2)
		if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
			return false
		end
		if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
			return true
		end
	end

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		preselect = cmp.PreselectMode.None,
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-c>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.abbr = truncateString(vim_item.abbr, 40)
				vim_item.kind = kind_icons[vim_item.kind]
				vim_item.menu = ({
					nvim_lsp = "",
					luasnip = "",
					buffer = "",
					path = "",
				})[entry.source.name]
				return vim_item
			end,
		},
		enabled = function()
			local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
			if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
				return false
			end
			local context = require("cmp.config.context")
			return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
		end,
		view = {
			entries = { name = "custom", selection_order = "near_cursor" },
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
		window = {
			-- documentation = cmp.config.window.bordered(),
			-- completion = cmp.config.window.bordered(),
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				deprioritize_snippet,
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.scopes,
				cmp.config.compare.score,
				-- cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	local ok, npairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
	if ok then
		cmp.event:on("confirm_done", npairs_cmp.on_confirm_done())
	end
end

return M
