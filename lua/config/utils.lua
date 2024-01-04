local M = {}

function M.scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local dir = string.format("ls -Ap %s | awk -F'[./]' '{print $1}'", directory)
    local pfile = popen(dir)

    for filename in pfile:lines() do
        if filename ~= "init" and filename ~= "" then
            i = i + 1
            t[i] = filename
        end
    end

    pfile:close()
    return t
end

function M.get_efm_languages()
    local languages = {}

    local t = M.scandir("~/.config/nvim/lua/plugins/lsp/none-ls/settings")
    for _, v in ipairs(t) do
        local lang = require("plugins.lsp.none-ls.settings." .. v)

        for _, filetype in ipairs(lang.filetypes) do
            languages[filetype] = lang.config
        end
    end

    return languages
end

function M.get_available_lsps() return M.scandir("~/.config/nvim/lua/plugins/lsp/config/settings") end

return M
