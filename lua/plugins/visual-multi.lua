local M = { "mg979/vim-visual-multi" }

M.init = function() vim.api.nvim_set_hl(-1, "MutliCursor", { link = "MatchParen" }) end

return M
