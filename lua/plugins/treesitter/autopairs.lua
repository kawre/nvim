local M = {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    lazy = false,
    enabled = false,
}

M.opts = {
    -- disable_filetype = { "TelescopePrompt", "spectre_panel" },
    -- fast_wrap = {
    -- 	map = "<M-e>",
    -- 	chars = { "{", "[", "(", '"', "'" },
    -- 	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    -- 	offset = 0, -- Offset from pattern match
    -- 	end_key = "$",
    -- 	keys = "qwertyuiopzxcvbnmasdfghjkl",
    -- 	check_comma = true,
    -- 	highlight = "PmenuSel",
    -- 	highlight_grey = "LineNr",
    -- },
    check_ts = true,
}

return M
