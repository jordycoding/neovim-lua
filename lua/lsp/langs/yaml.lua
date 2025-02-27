local util = require("lspconfig.util")

require("lspconfig")["yamlls"].setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
})
