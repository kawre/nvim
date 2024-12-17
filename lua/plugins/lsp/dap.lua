---@module 'dapui'

local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
}

M.config = function()
	local dap = require("dap")
	local ui = require("dapui")

	require("dapui").setup()
	require("dap-go").setup()

	require("nvim-dap-virtual-text").setup({ ---@diagnostic disable-line: missing-fields
		display_callback = function(variable)
			local name = string.lower(variable.name)
			local value = string.lower(variable.value)
			if
				name:match("secret")
				or name:match("api")
				or value:match("secret")
				or value:match("api")
			then
				return "*****"
			end

			if #variable.value > 15 then
				return " " .. string.sub(variable.value, 1, 15) .. "... "
			end

			return " " .. variable.value
		end,
	})

	dap.configurations.lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
		},
	}

	dap.adapters.nlua = function(callback, config)
		callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
	end

	dap.listeners.before.attach.dapui_config = ui.open
	dap.listeners.before.launch.dapui_config = ui.open
	dap.listeners.before.event_terminated.dapui_config = ui.close
	dap.listeners.before.event_exited.dapu_config = ui.close
end

M.keys = {
	{ "<F1>", "<cmd>DapContinue<CR>", desc = "[DAP] Continue" },
	{ "<F2>", "<cmd>DapStepInto<CR>", desc = "[DAP] Step Into" },
	{ "<F3>", "<cmd>DapStepOver<CR>", desc = "[DAP] Step Over" },
	{ "<F4>", "<cmd>DapStepOut<CR>", desc = "[DAP] Step Out" },
	{ "<F5>", "<cmd>DapStepBack<CR>", desc = "[DAP] Step Back" },
	{ "<leader>dd", "<cmd>DapToggleBreakpoint<CR>", desc = "[DAP] Toggle Breakpoint" },
	{
		"<leader>dc",
		function()
			require("dap").run_to_cursor()
		end,
		desc = "[DAP] Run to cursor",
	},
	{
		"<leader>dl",
		function()
			require("osv").launch({ port = 8086 })
		end,
		desc = "[DAP] Launch OSV",
	},
	{
		"<leader>de",
		function()
			require("dapui").eval(nil, { enter = true })
		end,
		desc = "[DAP] Eval",
	},
}

return M
