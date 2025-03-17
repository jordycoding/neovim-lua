local util = require("lspconfig.util")
local lsputil = require("lsp.util")

require("lspconfig").volar.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	init_options = {
		typescript = {
			tsdk = "$HOME/.npm-packages/lib/node_modules/typescript/lib",
		},
	},
	on_new_config = function(new_config, new_root_dir)
		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
		if lib_path then
			new_config.init_options.typescript.tsdk = lib_path
		end
	end,
})
