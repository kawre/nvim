local leet_arg = "leetcode.nvim"

local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = { "nvim-treesitter", "telescope.nvim", "nui.nvim", "noice.nvim" },
    lazy = leet_arg ~= vim.fn.argv()[1],
    dev = true,
}

---@type lc.UserConfig
M.opts = {
    arg = leet_arg,
    sql = "oraclesql",
    lang = "java",
    debug = true,

    console = {
        open_on_runcode = true,
    },
}

M.config = function(_, opts)
    local k_opts = {}

    vim.keymap.set("n", "<leader>lp", "<cmd>LcList<cr>", k_opts)
    vim.keymap.set("n", "<leader>lq", "<cmd>LcTabs<cr>", k_opts)
    vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>", k_opts)
    vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>", k_opts)
    vim.keymap.set("n", "<leader>lh", "<cmd>LcHints<cr>", k_opts)
    vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>", k_opts)
    vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>", k_opts)

    vim.keymap.set("n", "<leader>lr", "<cmd>LcRun<cr>", k_opts)
    vim.keymap.set("n", "<leader>ls", "<cmd>LcSubmit<cr>", k_opts)

    require("leetcode").setup(opts)
end

return M
