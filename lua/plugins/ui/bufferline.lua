return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			mode = "tabs",
			offsets = { { filetype = "NvimTree", text = "" } },
		},
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
	}
}
