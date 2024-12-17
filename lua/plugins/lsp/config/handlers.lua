local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

if pcall(require, "blink.cmp") then
	M.capabilities = require("blink.cmp").get_lsp_capabilities(M.capabilities)
elseif pcall(require, "cmp_nvim_lsp") then
	M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

M.setup = function()
	local user = require("config.user")

	local s = vim.diagnostic.severity

	local signs = {
		text = {
			[s.ERROR] = user.signs.error,
			[s.WARN] = user.signs.warn,
			[s.HINT] = user.signs.hint,
			[s.INFO] = user.signs.info,
		},
		numhl = {
			[s.ERROR] = "DiagnosticSignError",
			[s.WARN] = "DiagnosticSignWarn",
			[s.HINT] = "DiagnosticSignHint",
			[s.INFO] = "DiagnosticSignInfo",
		},
	}

	local config = {
		signs = signs,
		virtual_text = false,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap

	local mappings = {
		{ "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
		{ "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
		{ "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
		{ "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
		{ "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
		{ "n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>" },
		{ "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>" },
		{ "n", "<leader>li", "<cmd>LspInfo<cr>" },
		{ "n", "<leader>lI", "<cmd>LspInstallInfo<cr>" },
		{ "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>" },
		{ "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>" },
		{ "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
		{ "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
		-- { "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>"},
	}

	for _, map in ipairs(mappings) do
		keymap(bufnr, map[1], map[2], map[3], opts)
	end
end

M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end

	lsp_keymaps(bufnr)
end

return M
