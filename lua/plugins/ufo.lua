Fold_ignore = { "NeogitStatus", "nvcheatsheet", "neo-tree", "neotree" }

local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"snacks.nvim",
	},
	event = "VeryLazy",
}

M.init = function()
	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	vim.o.foldcolumn = "1" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	vim.api.nvim_create_autocmd("FileType", {
		pattern = Fold_ignore,
		callback = function()
			require("ufo").detach()
			vim.wo.foldenable = false
			vim.wo.foldcolumn = "0"
		end,
	})
end

M.opts = {
	-- close_fold_kinds = { "imports", "comment" },
	-- provider_selector = function(bufnr, filetype, buftype) --
	--     return { "treesitter", "indent" }
	-- end,
	fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
		local newVirtText = {}
		local suffix = (" 󰁂 %d "):format(endLnum - lnum)
		local sufWidth = vim.fn.strdisplaywidth(suffix)
		local targetWidth = width - sufWidth
		local curWidth = 0
		for _, chunk in ipairs(virtText) do
			local chunkText = chunk[1]
			local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if targetWidth > curWidth + chunkWidth then
				table.insert(newVirtText, chunk)
			else
				chunkText = truncate(chunkText, targetWidth - curWidth)
				local hlGroup = chunk[2]
				table.insert(newVirtText, { chunkText, hlGroup })
				chunkWidth = vim.fn.strdisplaywidth(chunkText)
				-- str width returned from truncate() may less than 2nd argument, need padding
				if curWidth + chunkWidth < targetWidth then
					suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
				end
				break
			end
			curWidth = curWidth + chunkWidth
		end
		table.insert(newVirtText, { suffix, "MoreMsg" })
		return newVirtText
	end,
}

M.keys = {
	{
		mode = "n",
		"zR",
		function()
			require("ufo").openAllFolds()
		end,
	},
	{
		mode = "n",
		"zM",
		function()
			require("ufo").closeAllFolds()
		end,
	},
}

return M
