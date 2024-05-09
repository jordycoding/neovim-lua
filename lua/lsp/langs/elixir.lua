local util = require("lsp.util")

require("lspconfig").elixirls.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	cmd = { "/run/current-system/sw/bin/elixir-ls" },
})
