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
    event = { "InsertEnter", "CmdLineEnter" },
}

local function truncateString(str, maxLen)
    if #str > maxLen then
        return str:sub(1, maxLen - 1) .. "…"
    else
        return str
    end
end

M.config = function()
    local user = require("config.user")

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local neotab = require("neotab")

    cmp.setup({ ---@diagnostic disable-line
        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        preselect = cmp.PreselectMode.None,
        completion = { ---@diagnostic disable-line
            completeopt = "menu,menuone,noinsert",
        },
        experimental = {
            ghost_text = false,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-e>"] = cmp.mapping.abort(),

            ["<C-c>"] = cmp.mapping.complete(),
            ["<C-Space>"] = cmp.mapping.complete(),

            ["<C-g>"] = function(fallback)
                if cmp.core.view:visible() then
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                else
                    fallback()
                end
            end,

            ["<CR>"] = function(fallback)
                if cmp.core.view:visible() then
                    cmp.confirm()
                else
                    fallback()
                end
            end,
            -- ["<Tab>"] = cmp.mapping(function()
            --     if cmp.visible() then
            --         cmp.select_next_item()
            --     elseif luasnip.jumpable(1) then
            --         luasnip.jump(1)
            --     else
            --         neotab.tabout()
            --     end
            -- end),
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
        ---@diagnostic disable-next-line
        view = {
            docs = {
                auto_open = false,
            },
            -- entries = { name = "custom", selection_order = "near_cursor" },
        },
        sources = cmp.config.sources({
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
            { name = "path" },
        }),
        ---@diagnostic disable-next-line
        window = {
            documentation = cmp.config.window.bordered(),
        },
        sorting = {
            priority_weight = 2,
            comparators = {
                cmp.config.compare.exact,
                cmp.config.compare.offset,
                cmp.config.compare.score,
                cmp.config.compare.scopes,
                cmp.config.compare.recently_used,
                cmp.config.compare.length,
                cmp.config.compare.sort_text,
                cmp.config.compare.locality,
                cmp.config.compare.order,
                cmp.config.compare.kind,
            },
        },
    })

    ---@diagnostic disable-next-line
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = "buffer" },
        }),
    })

    ---@diagnostic disable-next-line
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    ---@diagnostic disable-next-line
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    local ok, cmp_npairs = pcall(require, "nvim-autopairs.completion.cmp")
    if ok then cmp.event:on("confirm_done", cmp_npairs.on_confirm_done()) end
end

return M
