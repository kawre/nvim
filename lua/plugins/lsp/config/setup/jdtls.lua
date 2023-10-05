local M = {
    enabled = false,
}

M.setup = function()
    local jdtls = require("jdtls")
    local home = os.getenv("HOME")

    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    if root_dir == "" then return end

    local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local config_dir = jdtls_dir .. "/config_linux"
    local plugins_dir = jdtls_dir .. "/plugins"
    local path_to_jar = vim.fn.glob(plugins_dir .. "/org.eclipse.equinox.launcher_*.jar")
    local path_to_lombok = jdtls_dir .. "/lombok.jar"

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.expand(home .. "/.cache/jdtls/workspace/") .. project_name

    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {
            -- 💀
            "java",
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

            "-data",
            workspace_dir,
        },
        root_dir,

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
            java = {
                eclipse = {
                    downloadSources = true,
                },
                configuration = {
                    updateBuildConfiguration = "interactive",
                },
                maven = {
                    downloadSources = true,
                },
                implementationsCodeLens = {
                    enabled = true,
                },
                referencesCodeLens = {
                    enabled = true,
                },
                references = {
                    includeDecompiledSources = true,
                },
                inlayHints = {
                    parameterNames = {
                        enabled = "all", -- literals, all, none
                    },
                },
                format = {
                    enabled = true,
                    settings = {
                        -- url = "~/.config/jdtls/intellij-java-google-style.xml",
                        url = "~/.config/jdtls/Default.xml",
                        profile = "Default",
                    },
                },
            },
        },

        signatureHelp = { enabled = true },

        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
            importOrder = {
                "java",
                "javax",
                "com",
                "org",
            },
        },

        flags = {
            allow_incremental_sync = true,
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

        filetypes = { "java" },
        autostart = true,
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    jdtls.start_or_attach(config)
end

return M
