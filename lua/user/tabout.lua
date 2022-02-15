local ok, tabout = pcall(require, "tabout")
if not ok then
	return
end

tabout.setup({
	tabkey = "<Tab>",
	backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
	act_as_tab = true, -- shift content if tab out is not possible
	act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
	enable_backwards = true, -- well ...
	completion = true, -- if the tabkey is used in a completion pum
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = "`", close = "`" },
		{ open = "(", close = ")" },
		{ open = "[", close = "]" },
		{ open = "{", close = "}" },
	},
})
