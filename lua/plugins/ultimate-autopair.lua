local M = {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
}

M.opts = {
  tabout = {
    enable = true,
    map = "<tab>",
    hopout = true,
    do_nothing_if_fail = false,
  },
}

return M
