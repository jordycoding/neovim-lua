local util = require("lsp.util")
local arduinocli = "/run/current-system/sw/bin/arduino-cli"
local clangd = "/run/current-system/sw/bin/clangd"

vim.lsp.enable("arduino_language_server")
vim.lsp.config("arduino_language_server", {
	cmd = {
		"arduino-language-server",
		"-cli-config",
		os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml",
		"-fqbn",
		"esp32:esp32:esp32_family",
	},
})
