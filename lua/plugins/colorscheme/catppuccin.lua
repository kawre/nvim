local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
}

M.init = function()
  vim.cmd([[colorscheme catppuccin]])
end

M.opts = {
  integrations = {
    alpha = true,
    cmp = true,
    flash = true,
    gitsigns = true,
    illuminate = true,
    indent_blankline = { enabled = true },
    lsp_trouble = true,
    mason = true,
    mini = true,
    barbecue = {
      dim_dirname = true, -- directory name is dimmed by default
      bold_basename = true,
      dim_context = true,
      alt_background = false,
    },
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    navic = { enabled = true, custom_bg = "lualine" },
    neotest = true,
    noice = true,
    notify = true,
    neotree = true,
    semantic_tokens = true,
    telescope = true,
    treesitter = true,
    which_key = true,
  },
}

return M
