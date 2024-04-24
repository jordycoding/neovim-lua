return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			mode = "tabs",
			show_bufer_close_icons = false,
			show_close_icon = false,
			offsets = { { filetype = "NvimTree", text = "" } },
		},
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
	},
}
