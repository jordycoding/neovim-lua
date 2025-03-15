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
})
