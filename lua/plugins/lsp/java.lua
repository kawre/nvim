local M = {
	"nvim-java/nvim-java",
	dependencies = {
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"nvim-dap",
	},
	ft = "java",
}

M.opts = {
	java_test = {
		enable = false,
	},
	java_debug_adapter = {
		enable = false,
	},
	jdk = {
		auto_install = true,
	},
	notifications = {
		dap = false,
	},
}

return M
