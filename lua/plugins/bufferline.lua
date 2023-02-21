require("bufferline").setup({
	options = {
		mode = "tabs",
		offsets = { { filetype = "NvimTree", text = "" } },
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
