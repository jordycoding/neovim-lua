local omnisharp_bin = "/run/current-system/sw/bin/OmniSharp"
local pid = vim.fn.getpid()

require("lspconfig")["omnisharp"].setup({
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	env = { DOTNET_ROOT = os.getenv("DOTNET_ROOT") },
})
