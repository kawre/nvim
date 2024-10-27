local M = {
    "luukvbaal/statuscol.nvim",
    -- enabled = false,
}

M.opts = function()
    local builtin = require("statuscol.builtin")

    return {
        relculright = true,
        segments = {
            {
                text = { "%s" },
                -- condition = { true, builtin.not_empty },
                click = "v:lua.ScSa",
            },
            {
                text = { builtin.lnumfunc, " " },
                condition = { true, builtin.not_empty },
                click = "v:lua.ScLa",
            },
            {
                text = { builtin.foldfunc, " " },
                condition = { true, builtin.not_empty },
                click = "v:lua.ScFa",
            },
        },
        ft_ignore = Fold_ignore,
        -- bt_ignore = { "nofile" },
    }
end

return M
