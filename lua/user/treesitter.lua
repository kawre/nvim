local status_ok, configs = pcall(require, "nvim-treesitter.configs")
local _, parsers = pcall(require, "nvim-treesitter.parsers")
if not status_ok then
  return
end

configs.setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = false
  },
  autotag = {
    enable = true,
  },
  autopairs = {
		enable = true,
	},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  --rainbow = {
  --  enable = true,
  -- extended_mode = true,
  --    max_file_lines = nil,
  --   colors = {
  --    "#ffd700",
  --   "#da70d6",
  --  "#179fff",
  -- }
  -- },
  playground = {
    enable = true,
  }
})

parsers.get_parser_configs().cds = {
  install_info = {
    -- local path or git repo
    url = "~/apps/tree-sitter-cds",
    files = { "src/parser.c", "src/scanner.c" }
  },
  filetype = "cds",
  -- additional filetypes that use this parser
  used_by = { "cdl", "hdbcds" }
}


