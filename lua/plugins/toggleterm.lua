local M = {
    "akinsho/toggleterm.nvim",
    version = "*",
}

M.keys = {
    { "<C-t>", mode = { "n", "t" }, "<cmd>ToggleTerm<cr>" },
    { "<Esc>", mode = { "t" },      "<cmd>ToggleTerm<cr>" },
    { "jk",    mode = { "t" },      "<cmd>ToggleTerm<cr>" },
}

M.opts = {
    start_in_insert = true,
    direction = "float",
}

return M
