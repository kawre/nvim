local M = {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    enabled = true,
    dev = true,
}

---@type ntab.user.config
M.opts = {
    tabkey = "",
    act_as_tab = true,
    behavior = "nested",
    pairs = {
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "<", close = ">" },
    },

    debug = true,

    smart_punctuators = {
        enabled = true,

        semicolon = {
            enabled = true,
        },

        escape = {
            enabled = true,

            triggers = {
                ["+"] = {
                    pairs = {
                        { open = '"', close = '"' },
                    },
                    format = " %s ",
                    ft = { "java" },
                },
                [","] = {
                    pairs = {
                        { open = "'", close = "'" },
                        { open = '"', close = '"' },
                    },
                    format = "%s ",
                },
                ["="] = {
                    pairs = {
                        { open = "(", close = ")" },
                    },
                    ft = { "javascript", "typescript" },
                    format = " %s> ",
                    cond = "^$",
                },
            },
        },
    },
}

return M
