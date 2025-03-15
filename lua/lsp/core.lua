local bufnr = vim.api.nvim_get_current_buf()
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show line diagnostics in hover window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float({
			scope = "cursor",
			focusable = false,
			close_events = {
				"CursorMoved",
				"CursorMovedI",
				"BufHidden",
				"InsertCharPre",
				"InsertEnter",
				"WinLeave",
			},
		})
	end,
})

function diagnostic_toggle(global)
	local vars, bufnr, cmd
	if global then
		vars = vim.g
		bufnr = nil
	else
		vars = vim.b
		bufnr = 0
	end
	vars.diagnostics_enabled = not vars.diagnostics_enabled
	if vars.diagnostics_enabled then
		vim.diagnostic.show(nil, bufnr, nil, { virtual_text = true })
		vim.api.nvim_echo({ { "Enabling diagnostics…" } }, false, {})
	else
		vim.diagnostic.show(nil, bufnr, nil, { virtual_text = false })
		vim.api.nvim_echo({ { "disabling diagnostics…" } }, false, {})
	end
end
vim.keymap.set("n", "<leader>tT", diagnostic_toggle)

-- Disable virtualtext as it doesn't wrap and hovering works better
vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
})

-- Highlight groups config(for monaspace)
local function mod_hl(hl_name, opts)
	local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
	if is_ok then
		for k, v in pairs(opts) do
			hl_def[k] = v
		end
		vim.api.nvim_set_hl(0, hl_name, hl_def)
	end
end

local fancy_terms = { ghostty = true, WezTerm = true }
local term_program = os.getenv("TERM_PROGRAM")

if fancy_terms[term_program] then
	vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
		group = vim.api.nvim_create_augroup("Color", {}),
		pattern = "*",
		callback = function()
			-- Diagnostics
			mod_hl("DiagnosticFloatingError", { bold = true, italic = true })
			mod_hl("DiagnosticError", { bold = true, italic = true })
			mod_hl("DiagnosticFloatingWarn", { bold = true, italic = true })
			mod_hl("DiagnosticWarn", { bold = true, italic = true })
			mod_hl("DiagnosticFloatingInfo", { bold = true, italic = true })
			mod_hl("DiagnosticInfo", { bold = true, italic = true })
			mod_hl("DiagnosticFloatingHint", { bold = true, italic = true })
			mod_hl("DiagnosticHint", { bold = true, italic = true })
			mod_hl("DiagnosticFloatingOk", { bold = true, italic = true })
			mod_hl("DiagnosticOk", { bold = true, italic = true })
			mod_hl("DiagnosticVirtualTextError", { bold = true, italic = true })
			mod_hl("DiagnosticVirtualTextWarn", { bold = true, italic = true })
			mod_hl("DiagnosticVirtualTextInfo", { bold = true, italic = true })
			mod_hl("DiagnosticVirtualTextOk", { bold = true, italic = true })
			mod_hl("DiagnosticSignError", { bold = true, italic = true })
			mod_hl("DiagnosticSignWarn", { bold = true, italic = true })
			mod_hl("DiagnosticSignInfo", { bold = true, italic = true })
			mod_hl("DiagnosticSignHint", { bold = true, italic = true })
			mod_hl("DiagnosticSignOk", { bold = true, italic = true })
			mod_hl("Constant", {})

			-- Git blame
			mod_hl("GitSignsCurrentLineBlame", { bold = true, italic = true })

			-- Treesitter
			mod_hl("@comment.warning", { bold = true })
			mod_hl("@comment.error", { bold = true })
			mod_hl("@comment.note", { bold = true })
			mod_hl("@comment.todo", { bold = true })
			mod_hl("@string.documentation", { bold = true })
			mod_hl("@comment.documentatin", { bold = true })
			mod_hl("@comment.documentation.typescript", { bold = true })

			-- LSP
			mod_hl("LspInlayHint", { bold = true })

			-- Blink
			mod_hl("PmenuSel", {})
			mod_hl("Pmenu", {})
			mod_hl("BlinkCmpLabelMatch", {})

			-- Markdown
			mod_hl("@markup.link", { bold = false, italic = true })
			mod_hl("@markup.link.url", { bold = false, italic = true })
			mod_hl("@markup.link.markdown_inline", { bold = false, italic = true })
		end,
	})
end
