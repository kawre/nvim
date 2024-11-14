local M = {
    "kawre/markup.nvim",
    dev = true,
    lazy = false,
}

M.config = function()
    require("markup-playground").setup()
end

return M
