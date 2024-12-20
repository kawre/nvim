local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local Event = require("lazy.core.handler.event")
local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }
Event.mappings.LazyFile = { id = "LazyFile", event = lazy_file_events }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

require("lazy").setup({
	spec = LAZY_PLUGIN_SPEC,
	change_detection = {
		enabled = false,
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
