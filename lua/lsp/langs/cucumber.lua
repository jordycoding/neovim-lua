local util = require("lsp.util")

vim.lsp.enable("cucumber_language_server")
vim.lsp.config("cucumber_language_server", {
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
