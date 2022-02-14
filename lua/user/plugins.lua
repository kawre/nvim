local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/vscode.nvim'
  use 'mhartington/formatter.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'tamago324/nlsp-settings.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
  use 'abecodes/tabout.nvim'
	use 'nvim-lua/popup.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
	use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'theHamsta/nvim-dap-virtual-text'
  use {
  'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'David-Kunz/treesitter-unit'
  use 'p00f/nvim-ts-rainbow'
	use 'williamboman/nvim-lsp-installer'
  use 'tpope/vim-surround'
  use 'arcticicestudio/nord-vim'

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'onsails/lspkind-nvim'
  use 'David-Kunz/cmp-npm'

  -- formatter
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use 'l3mon4d3/luasnip'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
