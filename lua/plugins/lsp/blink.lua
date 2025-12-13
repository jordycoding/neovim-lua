return {
	{
		"saghen/blink.cmp",
		version = "v0.*",
		event = "InsertEnter",
		---@module 'blink.cmp'
		--@type blink-cmp.Config
		opts = {
			keymap = { preset = "enter" },
			snippets = {
				preset = "luasnip",
			},
			cmdline = {
				enabled = true,
				completion = {
					menu = {
						auto_show = false,
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "lazydev" },
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
					cucumber = { "lsp", "snippets" },
				},
				providers = {
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
			completion = {
				menu = {
					draw = {
						components = {
							-- customize the drawing of kind icons
							kind_icon = {
								text = function(ctx)
									-- default kind icon
									local icon = ctx.kind_icon
									-- if LSP source, check for color derived from documentation
									if ctx.item.source_name == "LSP" then
										local color_item = require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
										if color_item and color_item.abbr ~= "" then
											icon = color_item.abbr
										end
									end
									return icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									-- default highlight group
									local highlight = "BlinkCmpKind" .. ctx.kind
									-- if LSP source, check for color derived from documentation
									if ctx.item.source_name == "LSP" then
										local color_item = require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
										if color_item and color_item.abbr_hl_group then
											highlight = color_item.abbr_hl_group
										end
									end
									return highlight
								end,
							},
						},
					},
				},
				ghost_text = {
					enabled = true,
				},
				trigger = {
					show_on_blocked_trigger_characters = function(ctx)
						if vim.bo.filetype == "cucumber" then
							return { "\n" }
						end
						return { " ", "\n", "\t" }
					end,
				},
			},
			appearance = {
				-- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
				kind_icons = {
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
			signature = { enabled = true },
		},
	},
	{
		"saghen/blink.pairs",
		version = "*",
		dependencies = "saghen/blink.download",
		--- @module 'blink.pairs'
		--- @type blink.pairs.Config
		opts = {
			mappings = {
				enabled = true,
				cmdline = true,
				disabled_filetypes = {},
				pairs = {},
			},
			highlights = {
				enabled = true,
				cmdline = true,
				groups = {
					"BlinkPairsRed",
					"BlinkPairsYellow",
					"BlinkPairsBlue",
					"BlinkPairsOrange",
					"BlinkPairsGreen",
					"BlinkPairsPurple",
					"BlinkPairsCyan",
				},
				unmatched_group = "BlinkPairsUnmatched",
				matchparen = {
					enabled = true,
					-- known issue where typing won't update matchparen highlight, disabled by default
					cmdline = false,
					-- also include pairs not on top of the cursor, but surrounding the cursor
					include_surrounding = false,
					group = "BlinkPairsMatchParen",
					priority = 250,
				},
			},
			debug = false,
		},
	},
}
