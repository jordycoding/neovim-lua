local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<space>ca", rt.hover_actions.hover_actions, { buffer = bufnr })
		end,
	},
})
