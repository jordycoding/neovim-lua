local util = require("lsp.util")

require("lspconfig")["kotlin_language_server"].setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	init_options = {
		storagePath = vim.fn.stdpath("data") .. "/nvim-data",
	},
})
