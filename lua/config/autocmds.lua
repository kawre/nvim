local api = vim.api

vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- format on save
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  -- command = "silent lua vim.lsp.buf.format()",
  callback = function()
    require("plugins.lsp.format").format()
  end,
})
