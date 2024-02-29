local M = {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
        "friendly-snippets",
    },
    event = "VeryLazy",
}

M.keys = {
    {
        "<Tab>",
        -- function()
        --     return require("luasnip").jumpable(1) --
        --             and "<Plug>luasnip-jump-next"
        --         or "<Plug>(neotab-out)"
        -- end,
        function()
            return "<Plug>(neotab-out-luasnip)"
        end,
        expr = true,
        silent = true,
        mode = "i",
    },
    {
        "<Tab>",
        function()
            require("luasnip").jump(1)
        end,
        mode = "s",
    },
    {
        "<S-Tab>",
        function()
            require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
    },
}

M.opts = {}

M.config = function()
    -- HACK: Cancel the snippet session when leaving insert mode.
    local luasnip = require("luasnip")
    local unlink_group = vim.api.nvim_create_augroup("UnlinkSnippet", {})
    local types = require("luasnip.util.types")

    vim.api.nvim_create_autocmd("ModeChanged", {
        group = unlink_group,
        -- when going from select mode to normal and when leaving insert mode
        pattern = { "s:n", "i:*" },
        callback = function(event)
            if
                luasnip.session
                and luasnip.session.current_nodes[event.buf]
                and not luasnip.session.jump_active
            then
                luasnip.unlink_current()
            end
        end,
    })

    luasnip.setup({
        ext_opts = {
            [types.insertNode] = {
                active = {
                    virt_text = { { "", "LuasnipActiveIcon" } },
                    hl_mode = "combine",
                },
                unvisited = {
                    hl_group = "LuasnipUnvisited",
                },
            },
        },
    })
end

return M
