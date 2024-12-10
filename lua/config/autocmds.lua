local api = vim.api

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- format on save
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "lua vim.lsp.buf.format()",
})

-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = lsp_fmt_group,
--     callback = function(ev)
--         local efm = vim.lsp.get_active_clients({ name = "nonels", bufnr = ev.buf })
--
--         if vim.tbl_isempty(efm) then return end
--
--         vim.lsp.buf.format({ name = "efm" })
--     end,
-- })

-- -- properly detect markdown
-- vim.cmd([[
--     augroup filetypedetect
--       autocmd!
--       " Set .md files to use markdown syntax
--       autocmd BufNewFile,BufRead *.md set syntax=markdown
--     augroup END
-- ]])

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
