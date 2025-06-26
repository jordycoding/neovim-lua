vim.lsp.enable("elixirls")
vim.lsp.config("elixirls", {
	cmd = { "/run/current-system/sw/bin/elixir-ls" },
})
