local util = require("lsp.util")

require("lspconfig").cucumber_language_server.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	filetypes = {
		"cucumber",
		"feature",
	},
	settings = {
		cucumber = {
			features = {
				"src/**/*.feature",
			},
			glue = {
				"src/**/*.java",
			},
		},
	},
})
