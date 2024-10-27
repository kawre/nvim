local M = {
    cmd = {
        "arduino-language-server",
        "-clangd",
        "clangd",
        "-cli",
        "arduino-cli",
        "cli-config",
        "~/.arduino15/arduino-cli.yaml",
        "-fqbn",
        "arduino:avr:uno",
    },
}

return M
