local util = require("lsp.util")

require("lspconfig").intelephense.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
})
