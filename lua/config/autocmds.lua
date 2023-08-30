local api = vim.api

vim.cmd("autocmd BufEnter * set formatoptions-=cro")

api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.java",
	command = "lua vim.lsp.buf.format()",
})

-- format on save
api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "java" then
			api.nvim_command("FormatWrite")
		end
	end,
})
