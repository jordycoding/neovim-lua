local util = require("lspconfig.util")
local lsputil = require("lsp.util")

require("lspconfig").volar.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
})
