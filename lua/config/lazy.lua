local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local Event = require("lazy.core.handler.event")
local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }
Event.mappings.LazyFile = { id = "LazyFile", event = lazy_file_events }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

require("lazy").setup({
	spec = LAZY_PLUGIN_SPEC,
	change_detection = {
		enabled = true,
		notify = false,
	},
	install = {
		colorscheme = { "catppuccin", "default" },
	},
	dev = {
		path = "~/projects",
		fallback = true,
	},
	defaults = {
		lazy = true,
	},
	checker = {
		enabled = false,
		notify = false,
	},
})
