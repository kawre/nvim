local M = {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
}

M.build = function()
	vim.fn["mkdp#util#install"]()
end

return M
