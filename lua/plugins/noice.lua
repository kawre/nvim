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
            -- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            -- ["vim.lsp.util.stylize_markdown"] = true,
            -- ["cmp.entry.get_documentation"] = true,
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
                -- winhighlight = "NormalSB:NormalSB,FloatBorder:FloatBorder",
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
                },
            },
            view = "mini",
        },
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
        {

            filter = {
                any = {
                    -- { event = "msg_show", find = "written" },
                    -- { event = "msg_show", find = "fewer lines" },
                    -- { event = "msg_show", find = "more line" },
                    -- { event = "msg_show", find = "yanked" },
                    -- { event = "msg_show", find = "No lines in buffer" },
                    -- { event = "msg_show", find = "change; " },
                    -- { event = "msg_show", find = "changes; " },
                    -- { event = "msg_show", find = "line less; " },
                    -- { event = "msg_show", kind = "wmsg" },
                    -- { event = "msg_show", find = "No active Snippet" },
                    -- { event = "msg_show", find = "nil" },
                    { event = "msg_show", kind = "progress" },
                    { event = "lsp", kind = "progress", find = "Validate documents" },
                    {
                        event = "lsp",
                        kind = "progress",
                        find = "Publish Diagnostics",
                    },
                },
            },
            opts = { skip = true },
        },
    },
}

return M
