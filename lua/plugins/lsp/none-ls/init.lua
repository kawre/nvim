local M = {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
}

function M.config()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting

    null_ls.setup({
        debug = true,
        sources = {
            formatting.stylua,
            formatting.prettier,
            formatting.black,
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
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.completion.spell,
        },
    })
end

return M
