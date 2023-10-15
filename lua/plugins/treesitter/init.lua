local M = {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    dependencies = {
        require("plugins.treesitter.autotag"),
        require("plugins.treesitter.surround"),
        -- require("plugins.treesitter.autopairs"),
    },
}

M.opts = {
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
}

M.config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end

return M
