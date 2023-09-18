local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	version = false,
}

local function truncateString(str, maxLen)
	if #str > maxLen then
		return str:sub(1, maxLen - 1) .. "…"
	else
		return str
	end
end

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local user = require("config.user")

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		preselect = cmp.PreselectMode.None,
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-c>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			-- ["<Tab>"] = function()
			-- 	if cmp.visible() then
			-- 		cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })
			-- 	elseif luasnip.expand_or_jumpable() then
			-- 		vim.fn.feedkeys(
			-- 			vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
			-- 			""
			-- 		)
			-- 	else
			-- 		vim.cmd("Tabout")
			-- 	end
			-- end,
		}),
		formatting = {
			expandable_indicator = false,
			fields = { "kind", "abbr", "menu" },
			format = function(_, item)
				item.menu = item.kind
				item.menu_hl_group = "CmpItemKind" .. item.kind
				item.kind = user.kinds[item.kind]
				item.abbr = truncateString(item.abbr, 50)

				return item
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
			-- { name = "nvim_lua" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
		window = {
			documentation = cmp.config.window.bordered(),
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				-- deprioritize_snippet,
				cmp.config.compare.exact,
				cmp.config.compare.offset,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.length,
				cmp.config.compare.sort_text,
				cmp.config.compare.locality,
				cmp.config.compare.scopes,
				cmp.config.compare.order,
				cmp.config.compare.kind,
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
