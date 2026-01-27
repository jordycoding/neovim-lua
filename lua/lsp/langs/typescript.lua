vim.lsp.enable("vtsls")
vim.lsp.config("vtsls", {
	filetypes = {
		"vue",
	},
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = "$HOME/.npm-packages/lib/node_modules/@vue/typescript-plugin",
						languages = { "typescript", "javascript", "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
		typescript = {
			inlayHints = {
				parameterNames = {
					enabled = "literals",
				},
			},
		},
	},
})

vim.lsp.enable("tsgo")
vim.lsp.config("tsgo", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
})
