return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	config = function()
		require("catppuccin").setup(
			---@type CatppuccinOptions
			{
				flavour = "mocha",
				integrations = {
					snacks = true,
					lsp_trouble = true,
					which_key = true,
					flash = true,
					harpoon = true,
					fidget = true,
					blink_cmp = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = false,
						},
					},
					treesitter = true,
					treesitter_context = true,
					telescope = {
						enabled = true,
						style = "nvchad",
					},
					headlines = true,
					navic = {
						enabled = true,
						custom_bg = "NONE",
					},
					dap = {
						enabled = true,
						enable_ui = true,
					},
				},
			}
		)
		require("bufferline").setup({
			options = {
				mode = "tabs",
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = { { filetype = "NvimTree", text = "" } },
				always_show_bufferline = false,
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
	end,
}
