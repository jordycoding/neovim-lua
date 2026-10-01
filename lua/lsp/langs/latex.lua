vim.lsp.config("texlab", {
	settings = {
		texlab = {
			build = {
				args = { "-lualatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = true,
				onSave = true,
			},
			forwardSearch = {
				executable = "zathura",
				args = { "--synctex-forward", "%l:1:%f", "%p" },
			},
		},
	},
})
vim.lsp.enable("texlab")
