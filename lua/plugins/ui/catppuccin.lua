return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	config = function()
		require("catppuccin").setup({
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
				},
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				treesitter = true,
				treesitter_context = true,
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
			custom_highlights = function(C)
				return {
					PmenuSel = { bg = C.surface1, fg = "NONE" },
					Pmenu = { fg = C.text, bg = C.surface0 },
					CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
					CmpItemKindKeyword = { fg = C.base, bg = C.red },
					CmpItemKindText = { fg = C.base, bg = C.teal },
					CmpItemKindMethod = { fg = C.base, bg = C.blue },
					CmpItemKindConstructor = { fg = C.base, bg = C.blue },
					CmpItemKindFunction = { fg = C.base, bg = C.blue },
					CmpItemKindFolder = { fg = C.base, bg = C.blue },
					CmpItemKindModule = { fg = C.base, bg = C.blue },
					CmpItemKindConstant = { fg = C.base, bg = C.peach },
					CmpItemKindField = { fg = C.base, bg = C.green },
					CmpItemKindProperty = { fg = C.base, bg = C.green },
					CmpItemKindEnum = { fg = C.base, bg = C.green },
					CmpItemKindUnit = { fg = C.base, bg = C.green },
					CmpItemKindClass = { fg = C.base, bg = C.yellow },
					CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
					CmpItemKindFile = { fg = C.base, bg = C.blue },
					CmpItemKindInterface = { fg = C.base, bg = C.yellow },
					CmpItemKindColor = { fg = C.base, bg = C.red },
					CmpItemKindReference = { fg = C.base, bg = C.red },
					CmpItemKindEnumMember = { fg = C.base, bg = C.red },
					CmpItemKindStruct = { fg = C.base, bg = C.blue },
					CmpItemKindValue = { fg = C.base, bg = C.peach },
					CmpItemKindEvent = { fg = C.base, bg = C.blue },
					CmpItemKindOperator = { fg = C.base, bg = C.blue },
					CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
					CmpItemKindCopilot = { fg = C.base, bg = C.teal },
				}
			end,
		})
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
