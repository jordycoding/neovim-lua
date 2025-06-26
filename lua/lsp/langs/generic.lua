local util = require("lsp.util")

local servers = {
	"pyright",
	"bashls",
	"ansiblels",
	"cssls",
	"html",
	"docker_compose_language_service",
	"dockerls",
	"svelte",
	"texlab",
	"eslint",
	"prismals",
	"emmet_language_server",
	"clangd",
	"nixd",
	"gopls",
	"ltex",
	"jsonls",
	"dartls",
	"astro",
	"kulala_ls",
	"lemminx",
	"roslyn_ls",
	"intelephense",
	"yamlls",
}
for _, lsp in pairs(servers) do
	vim.lsp.enable(lsp)
end
