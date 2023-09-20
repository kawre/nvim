local M = {
  "HiPhish/rainbow-delimiters.nvim",
  enabled = false,
}

M.config = function()
  local rainbow = require("rainbow-delimiters")

  -- vim.cmd("highlight RainbowDelimiterRed guifg=#ffd700")
  -- vim.cmd("highlight RainbowDelimiterYellow guifg=#da70d6")
  -- vim.cmd("highlight RainbowDelimiterBlue guifg=#179fff")

  require("rainbow-delimiters.setup")({
    strategy = {
      [""] = rainbow.strategy["global"],
      vim = rainbow.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-blocks",
    },
    highlight = {
      -- 		"#ffd700",
      -- 		"#da70d6",
      -- 		"#179fff",
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  })
end

return M
