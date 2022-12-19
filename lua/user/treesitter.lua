local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

treesitter.setup {
}
