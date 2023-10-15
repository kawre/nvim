local api = vim.api

local function augroup(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- format on save
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    -- command = "silent lua vim.lsp.buf.format()",
    callback = function() require("plugins.lsp.format").format() end,
})

-- properly detect markdown
vim.cmd([[
    augroup filetypedetect
      autocmd!
      " Set .md files to use markdown syntax
      autocmd BufNewFile,BufRead *.md set syntax=markdown
    augroup END
]])

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})
