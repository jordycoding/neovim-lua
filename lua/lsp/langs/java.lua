local home = os.getenv("HOME")
local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

vim.lsp.enable("jdtls")
vim.lsp.config("jdtls", {
	cmd = { "jdtls", "-data", workspace_folder },
})
