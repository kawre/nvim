local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4

-- nvim-jdtls
local jdtls = require("jdtls")
require("plugins.lsp.handlers").setup()

local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_linux"
local plugins_dir = jdtls_dir .. "/plugins"
local path_to_jar = plugins_dir .. "/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"
local path_to_lombok = jdtls_dir .. "/lombok.jar"

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
os.execute(string.format("mkdir %s 2>/dev/null", workspace_dir))

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })

local Progress = require("noice.lsp.progress")
local orig = vim.lsp.handlers["$/progress"]
local Util = require("noice.util")

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		-- 💀
		"java", -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. path_to_lombok,
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		path_to_jar,

		"-configuration",
		config_dir,

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir,

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {},
	},
	on_attach = require("plugins.lsp.handlers").on_attach,
	capabilities = require("plugins.lsp.handlers").capabilities,
	handlers = {
		["language/status"] = function() end,
	},
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
