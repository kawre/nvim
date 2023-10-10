local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.opt.termguicolors = true

require("lazy").setup({
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-tree/nvim-web-devicons",
            "rcarriga/nvim-notify",
        },
        opts = {
            arg = "leetcode.nvim",
            lang = "java",
        },
        config = function(_, opts)
            vim.keymap.set("n", "<leader>lq", "<cmd>LcQuestionTabs<cr>")
            vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>")
            vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>")
            vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>")
            vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>")

            require("leetcode").setup(opts)
        end,
        -- event = "VeryLazy",
    },
})
