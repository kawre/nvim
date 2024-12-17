local M = {
	"mg979/vim-visual-multi",
	branch = "master",
	event = "LazyFile",
}

M.init = function()
	vim.g.VM_maps = {
		["Find Under"] = "<C-d>",
		["Find Subword Under"] = "<C-d>",
	}
end

return M
