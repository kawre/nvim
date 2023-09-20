local M = {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
}

-- M.init = function()
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#696D86 gui=nocombine]])
-- end

M.opts = {
  show_current_context = true,
  context_char = "▎",
  -- char = "▎",
  -- show_current_context_start = true,
  -- strict_tabs = true,
  max_indent_increase = 1,
  -- context_highlight_list = { "IndentBlanklineIndent1" },
}

return M
