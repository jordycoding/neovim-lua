local util = require("lsp.util")

vim.lsp.enable("powershell_es")
vim.lsp.config("powershell_es", {
	bundle_path = os.getenv("HOME") .. "/bin/PowerShellEditorServices",
})
