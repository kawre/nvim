vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- format on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])
