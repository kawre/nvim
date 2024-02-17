local M = {
    "nvim-lua/plenary.nvim",
    dev = true,
}

M.init = function() vim.g.plenary_curl_bin_path = "curl" end

return M
