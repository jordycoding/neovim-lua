local util = require("lsp.util")

require("lspconfig").tailwindcss.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
})
