local leet_arg = "leetcode.nvim"

local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    -- lazy = leet_arg ~= vim.fn.argv()[1],
    dependencies = {
        "bufferline.nvim",
        "telescope.nvim",
        "plenary.nvim",
        "nui.nvim",
        "nvim-notify",
        "nvim-web-devicons",
        "nvim-treesitter",
    },
    cmd = "Leet",
    dev = true,
}

---@return lc.UserConfig
M.opts = function()
    local imports = require("leetcode.config.imports")

    return {
        arg = leet_arg,
        lang = "python3",
        debug = true,

        storage = {
            home = "~/projects/leetcode",
        },

        cn = {
            enabled = false,
        },

        plugins = {
            non_standalone = true,
        },

        injector = {
            ["cpp"] = {
                before = { "#include <bits/stdc++.h>", "using namespace std;" },
            },
            ["java"] = {
                before = true,
            },
            ["python3"] = {
                before = vim.list_extend({ "from .leetcode import *" }, imports.python3),
            },
            ["python"] = {
                before = true,
            },
        },

        cache = { update_interval = 60 * 60 * 24 },

        hooks = {
            ["enter"] = function()
                pcall(vim.cmd, [[silent! Copilot disable]])
            end,
        },

        theme = {},

        keys = {
            toggle = { "q", "<Esc>" },
        },

        console = {
            open_on_runcode = true,
        },

        image_support = false,
    }
end

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
