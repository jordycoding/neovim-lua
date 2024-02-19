local util = require("lsp.util")

local servers = {
	"pyright",
	"bashls",
	"ansiblels",
	"nil_ls",
	"tailwindcss",
	"cssls",
	"html",
	"docker_compose_language_service",
	"dockerls",
	"svelte",
	"texlab",
	"eslint",
	"prismals",
	"angularls",
	"emmet_ls",
	"clangd",
}
for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = util.on_attach,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
		capabilities = util.capabilities,
	})
end
