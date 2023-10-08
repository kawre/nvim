local usr_arg = "leetcode.nvim"

local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-tree/nvim-web-devicons",

        -- recommended
        -- "rcarriga/nvim-notify",
    },
    opts = {
        arg = usr_arg,
        -- configuration goes there
    },
    config = function(_, opts)
        vim.keymap.set("n", "<leader>lq", "<cmd>LcQuestionTabs<cr>")
        vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>")
        vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>")
        vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>")
        vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>")

        require("leetcode").setup(opts)
    end,
    cond = function() return usr_arg == vim.fn.argv()[1] end,
    dev = true,
}

-- M.opts = {
--     arg = "leetcode.nvim",
--     domain = "com",
--     lang = "java",
--     sql = "oraclesql",
-- }
--
-- M.config = function(_, opts)
--     vim.keymap.set("n", "<leader>lq", "<cmd>LcQuestionTabs<cr>")
--     vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>")
--     vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>")
--     vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>")
--     vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>")
--
--     require("leetcode").setup(opts)
-- end

-- M.cond = function() return "leetcode.nvim" == vim.fn.argv()[1] end

return M
