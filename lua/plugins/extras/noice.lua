local M = {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    priority = 1000,
    lazy = false,
}

M.opts = {
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = false,
    },
    views = {
        cmdline_popup = {
            border = {
                padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                any = {
                    { find = "%d+L, %d+B" },
                    { find = "; after #%d+" },
                    { find = "; before #%d+" },
                    { find = "^%d+ fewer lines$" },
                    { find = "^%d+ more lines$" },
                    { find = "^%d+ lines yanked$" },
                },
            },
            view = "mini",
        },
        {
            filter = {
                event = "lsp",
                any = {
                    { kind = "progress", find = "Validate documents" },
                    { kind = "progress", find = "Publish Diagnostics" },
                },
            },
            opts = { skip = true },
        },
    },
}

return M
