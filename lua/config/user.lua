local M = {}

M.kinds = {
    Text = "󰉿",
    Method = "",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "α",
    Class = "󰌗",
    Interface = "",
    Module = "󰅩",
    Namespace = "󰅩",
    Property = "",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    EnumMember = "",
    Keyword = "",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉖",
    Constant = "π",
    Struct = "",
    Event = "ϟ",
    Operator = "󰆕",
    TypeParameter = "τ",
    Package = "",
    String = "󰉾",
    Number = "λ",
    Boolean = "",
    Array = "󰅪",
    Object = "󰅩",
    Key = "",
    Null = "∅",
    Copilot = "",
}

M.signs = {
    error = "",
    warn = "",
    hint = "󰛨",
    info = "",
}

M.symbols = {
    modified = "",
    readonly = "",
    newfile = "",
    unnamed = "",
    ellipsis = "…",
    separator = "",
}

return M
