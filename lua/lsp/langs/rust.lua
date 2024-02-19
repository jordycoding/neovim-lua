local util = require("lsp.util")

vim.g.rustaceanvim = {
	server = {
		on_attach = util.on_attach,
	},
}
