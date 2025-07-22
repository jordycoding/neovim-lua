local home = os.getenv("HOME")
local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

vim.lsp.enable("jdtls")
vim.lsp.config("jdtls", {
	before_init = function(params, config)
		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})
	end,
	cmd = { "jdtls", "-data", workspace_folder },
})
