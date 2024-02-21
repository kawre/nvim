local leet_arg = "leetcode.nvim"

local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    -- lazy = leet_arg ~= vim.fn.argv()[1],
    cmd = "Leet",
    dev = true,
}

---@type lc.UserConfig
M.opts = {
    arg = leet_arg,
    lang = "python3",
    debug = true,

    storage = {
        home = "~/projects/leetcode",
    },

    -- plugins = {
    --     nonstandalone = true,
    -- },

    injector = {
        ["cpp"] = {
            before = { "#include <bits/stdc++.h>", "using namespace std;" },
        },
        ["java"] = {
            before = { "import java.util.*;" },
        },
        ["python3"] = {
            before = { "from typing import *" },
        },
    },

    cache = { update_interval = 60 * 60 * 24 },

    cn = {
        enabled = false,
    },

    hooks = {
        LeetEnter = {
            function() pcall(vim.cmd, "silent Copilot disable") end,
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
    { "<leader>lo", mode = { "n" }, "<cmd>Leet open<cr>" },
}

return M
