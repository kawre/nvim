local leet_arg = "leetcode.nvim"

local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    -- dependencies = { "nvim-treesitter", "telescope.nvim", "nui.nvim", "noice.nvim" },
    lazy = leet_arg ~= vim.fn.argv()[1],
    dev = true,
}

---@type lc.UserConfig
M.opts = {
    arg = leet_arg,
    lang = "python3",
    debug = true,

    directory = vim.fn.expand("~/projects/leetcode"),

    injector = {
        ["cpp"] = {
            before = { "#include <bits/stdc++.h>", "using namespace std;" },
        },
        ["java"] = {
            before = { "import java.util.*;" },
        },
    },

    cache = { update_interval = 60 * 60 },

    cn = {
        enabled = false,
    },

    hooks = {
        LeetEnter = {
            function() vim.cmd("silent Copilot disable") end,
        },
    },

    image_support = false,
}

M.keys = {
    { "<leader>lq", mode = { "n" }, "<cmd>Leet tabs<cr>" },
    { "<leader>lm", mode = { "n" }, "<cmd>Leet menu<cr>" },
    { "<leader>lc", mode = { "n" }, "<cmd>Leet console<cr>" },
    { "<leader>lh", mode = { "n" }, "<cmd>Leet info<cr>" },
    { "<leader>ll", mode = { "n" }, "<cmd>Leet lang<cr>" },
    { "<leader>ld", mode = { "n" }, "<cmd>Leet desc<cr>" },
    { "<leader>lr", mode = { "n" }, "<cmd>Leet run<cr>" },
    { "<leader>ls", mode = { "n" }, "<cmd>Leet submit<cr>" },
    { "<leader>ly", mode = { "n" }, "<cmd>Leet yank<cr>" },
}

return M
