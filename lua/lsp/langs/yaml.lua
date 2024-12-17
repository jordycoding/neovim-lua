local util = require("lspconfig.util")

require("lspconfig")["yamlls"].setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.yaml"] = "/*",
			},
		},
	},
})
