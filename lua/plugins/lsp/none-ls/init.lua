local M = {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
}

function M.config()
    local null_ls = require("null-ls")
    -- local u = require("config.utils")

    -- u.get_efm_languages()

    local formatting = null_ls.builtins.formatting

    null_ls.setup({
        debug = true,
        sources = {
            -- lua
            formatting.stylua,

            -- python
            null_ls.builtins.diagnostics.flake8,
            formatting.black,

            formatting.prettier,
            formatting.fish_indent,
            formatting.djlint,
            formatting.shfmt,
            -- formatting.prettier.with {
            --   extra_filetypes = { "toml" },
            --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
            -- },
            -- formatting.eslint,
            -- null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.diagnostics.fish,
            null_ls.builtins.diagnostics.markdownlint,
            null_ls.builtins.completion.spell,
        },
    })
end

return M
