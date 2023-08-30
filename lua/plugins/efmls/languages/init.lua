local utils = require("config.utils")

local function get_languages()
  local languages = {}
  local t = utils.scandir("~/.config/nvim/lua/plugins/efm/languages")

  for _, v in ipairs(t) do
    local lang = require("plugins.efm.languages." .. v)

    for _, filetype in ipairs(lang.filetypes) do
      languages[filetype] = lang.config
    end
  end

  return languages
end

local languages = get_languages()

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

return efmls_config
