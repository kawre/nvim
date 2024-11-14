local M = {
    "Saghen/blink.cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = "friendly-snippets",
    version = "v0.*",
}

M.opts = function()
    local user = require("config.user")

    return {
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

        sources = {
            completion = {
                enabled_providers = { "lsp", "snippets", "buffer", "path", "lazydev" },
            },

            providers = {
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },
        -- fuzzy = {
        -- sorts = { "label", "score", "kind" },
        -- sorts = { "kind", "score", "label" },
        -- },

        kind_icons = user.kinds,
        nerd_font_variant = "mono",
    }
end

return M
