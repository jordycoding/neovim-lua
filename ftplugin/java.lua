local opts = { noremap = true, silent = true }
local navic = require("nvim-navic")
local home = os.getenv("HOME")
local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local util = require("lsp.util")

local config = {
	on_attach = util.on_attach,
	cmd = { "jdtls", "-data", workspace_folder },
	root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", "mvnw" }, { upward = true })[1]),
	capabilities = util.capabilities,
}
require("java").setup({
	jdk = {
		auto_install = false,
	},
})
require("lspconfig").jdtls.setup(config)
