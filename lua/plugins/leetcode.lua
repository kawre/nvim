local lc_arg = "leetcode.nvim"

local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = { "nvim-treesitter", "telescope.nvim", "nui.nvim" },
    cond = function() return lc_arg == vim.fn.argv()[1] end,
    dev = true,
}

M.opts = {
    arg = lc_arg,
    sql = "oraclesql",
    lang = "java",
    debug = true,
}

M.config = function(_, opts)
    vim.keymap.set("n", "<leader>lp", "<cmd>LcList<cr>")
    vim.keymap.set("n", "<leader>lq", "<cmd>LcQuestionTabs<cr>")
    vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>")
    vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>")
    vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>")
    vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>")

    vim.keymap.set("n", "<leader>lr", "<cmd>LcRun<cr>")
    vim.keymap.set("n", "<leader>ls", "<cmd>LcSubmit<cr>")

    require("leetcode").setup(opts)
end

return M
