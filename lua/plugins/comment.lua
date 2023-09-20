local M = {
    "numToStr/Comment.nvim",
}

M.opts = {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = "<C-/>",
        block = "gbc",
    },
    opleader = {
        line = "<C-/>",
        block = "gb",
    },
    extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
    },
    mappings = {
        basic = true,
        extra = true,
    },
    pre_hook = nil,
    post_hook = nil,
}

return M
