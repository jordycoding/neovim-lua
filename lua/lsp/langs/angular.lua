local confutil = require("lspconfig.util")
local util = require("lsp.util")

local function getcmd(root_dir)
	found_nm = util.path.join(root_dir, "node_modules")
	return { "ngserver", "--stdio", "--tsProbeLocations", found_nm("--ngProbeLocations"), found_nm }
end

local cmd = {
	"ngserver",
	"--stdio",
	"--tsProbeLocations",
	"$HOME/.npm-packages/lib",
	"--ngProbeLocations",
	"$HOME/.npm-packages/lib",
}

vim.lsp.enable("angularls")
vim.lsp.config("angularls", {
	cmd = cmd,
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = getcmd(new_root_dir)
	end,
})
