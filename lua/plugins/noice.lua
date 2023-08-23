local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

M.opts = {
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = false,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		-- signature = {
		-- 	view = "mini",
		-- },
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true,
		lsp_doc_border = false,
	},
	views = {
		cmdline_popup = {
			border = {
				style = "none",
				padding = { 1, 3 },
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
	routes = {
		{
			filter = {
				any = {
					{ event = "msg_show", find = "written" },
					{ event = "msg_show", find = "fewer lines" },
					{ event = "msg_show", find = "more line" },
					{ event = "msg_show", find = "yanked" },
					{ event = "msg_show", find = "No lines in buffer" },
					{ event = "msg_show", find = "change; " },
					{ event = "msg_show", find = "line less; " },
					{ event = "msg_show", kind = "wmsg" },
					{ event = "msg_show", find = "No active Snippet" },
				},
			},
			opts = { skip = true },
		},
	},
}

return M
