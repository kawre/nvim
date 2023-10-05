local M = {
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
    "utilyre/sentiment.nvim",
    enabled = false,
}

M.init = function()
    -- vim.api.nvim_set_hl(0, "MatchParen", { link = "DiagnosticError" })
    -- `matchparen.vim` needs to be disabled manually in case of lazy loading
    vim.g.loaded_matchparen = 1
end

M.opts = {}

return M
