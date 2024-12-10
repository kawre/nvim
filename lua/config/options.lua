package.path = package.path
	.. ";"
	.. vim.fn.expand("$HOME")
	.. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

local opt = vim.opt

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0 -- always show tabs
opt.smartcase = false -- smart case vim.opt.smartindent = false -- make indenting smarter again opt.smartindent = true
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = false -- convert tabs to spaces
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3 -- only the last window will always have a status line
opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
opt.ruler = false -- hide the line and column number of the cursor position
opt.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 2 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
--opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
opt.iskeyword:append("-") -- treats words with `-` as single words
opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
opt.linebreak = true
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.spelllang = { "en" }

-- opt.fillchars = {
-- }
-- opt.fillchars:append({
--     eob = " ",
--     foldopen = "",
--     foldclose = "",
--     fold = "⸱",
--     -- fold = " ",
--     foldsep = " ",
--     diff = "╱",
-- })
-- opt.list = true
-- opt.listchars:append({
-- eol = "↲",
-- extends = "»",
-- precedes = "«",
-- space = "·",
-- nbsp = "␣",
-- })
-- opt.fillchars.eob = "*"
-- opt.fillchars.space = "*"
-- opt.fillchars = {
--     vert = "▕", -- alternatives │
--     fold = " ",
--     eob = " ", -- suppress ~ at EndOfBuffer
--     diff = "╱", -- alternatives = ⣿ ░ ─
--     msgsep = "‾",
--     foldopen = "▾",
--     foldsep = "│",
--     foldclose = "▸",
-- }

vim.g.loaded_perl_provider = 0
vim.g.markdown_recommended_style = 0
