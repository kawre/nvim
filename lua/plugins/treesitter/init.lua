local M = {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },
	dependencies = {
		require("plugins.treesitter.autopairs"),
		require("plugins.treesitter.surround"),
		require("plugins.treesitter.tabout"),
	},
}

M.opts = {
	ensure_installed = "all",
	sync_install = false,
	indent = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	-- 	max_file_lines = nil, -- Do not enable for files with more than n lines, int
	-- 	colors = {
	-- 		"#ffd700",
	-- 		"#da70d6",
	-- 		"#179fff",
	-- 	},
	-- },
}

return M
