local util = require("lsp.util")

require("lspconfig").vtsls.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/home/jordy/.npm-packages/lib/node_modules/@vue/typescript-plugin",
						languages = { "typescript", "javascript", "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
})
