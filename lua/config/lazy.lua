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

require("lazy").setup({
    spec = {
        { import = "plugins.colorscheme" },
        { import = "plugins" },
        { import = "plugins.lsp" },
        { import = "plugins.extras" },
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    install = {
        colorscheme = { "catppucin", "default" },
    },
    dev = {
        path = "~/projects",
    },
    defaults = {
        lazy = true,
    },
    checker = {
        enabled = false,
    },
})
