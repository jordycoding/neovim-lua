return {
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
}
