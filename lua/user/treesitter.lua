local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
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
	indent = {
		enable = false,
		disable = { "yaml" },
	},
})
