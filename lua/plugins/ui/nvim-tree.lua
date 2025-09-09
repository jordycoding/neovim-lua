return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	cmd = {
		"NvimTreeOpen",
		"NvimTreeClose",
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeRefresh",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeClipboard",
		"NvimTreeResize",
		"NvimTreeCollapse",
		"NvimTreeCollapseKeepBuffers",
		"NvimTreeHiTest",
	},
	keys = {
		{ "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim tree" },
	},
	opts = {
		actions = {
			open_file = {
				resize_window = true,
			},
		},
		view = {
			side = "left",
		},
	},
}
