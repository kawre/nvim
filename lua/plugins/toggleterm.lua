local M = {
    "akinsho/toggleterm.nvim",
    version = "*",
}

M.keys = {
    { "<C-t>", mode = { "n", "t" }, "<cmd>ToggleTerm<cr>" },
    { "<Esc>", mode = { "t" }, "<cmd>ToggleTerm<cr>" },
    { "jk", mode = { "t" }, "<cmd>ToggleTerm<cr>" },
}

M.opts = {
    start_in_insert = true,
    direction = "float",
    float_opts = {
        border = "curved",
    },
    autochdir = true,
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        NormalFloat = {
            link = "NormalSB",
        },
        FloatBorder = {
            link = "FloatBorder",
        },
    },
}

return M
