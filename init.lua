-- _G.dd = function(...)
-- 	require("snacks").debug.inspect(...)
-- end
-- _G.bt = function()
-- 	require("snacks").debug.backtrace()
-- end
-- vim.print = _G.dd

require("config.launch")
require("config.options")
require("config.keymaps")
require("config.autocmds")

spec("plugins.colorscheme")
spec("plugins")
spec("plugins.lsp")
spec("plugins.extras")

require("config.lazy")
