local util = require("lsp.util")

require("lspconfig").powershell_es.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	bundle_path = os.getenv("HOME") .. "/bin/PowerShellEditorServices",
})
