local M = {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
}

M.keys = {
    { "<leader>rn", ":IncRename ", desc = "Rename" },
    -- { "<leader>lq", "<cmd>LcQuestionTabs<cr>", desc = "View All Opened Questions" },
    -- { "<leader>lm", "<cmd>LcMenu<cr>",         desc = "Open Menu" },
    -- { "<leader>lc", "<cmd>LcConsole<cr>",      desc = "Open Console" },
    -- { "<leader>ll", "<cmd>LcLang<cr>",         desc = "Change Language for the current session" },
}

M.opts = {}

return M
