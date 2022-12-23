local ok, indent = pcall(require, "indent-blankline")
if not ok then
	return
end

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
})

local ok2, hightlight = pcall(require, "treesitter_indent_object")
if not ok2 then
	return
end


hightlight.setup({
})
