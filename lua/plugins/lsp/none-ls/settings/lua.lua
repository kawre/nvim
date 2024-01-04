local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local opts = {
    formatting.stylua,
}

return table.unpack(opts)
