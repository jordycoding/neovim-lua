local confutil = require("lspconfig.util")
local util = require("lsp.util")

local project_library_path = confutil.root_pattern("angular.json") .. "/node_modules"
local cmd =
	{ "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }

require("lspconfig").angularls.setup({
	on_attach = util.on_attach,
	capabilities = util.capabilities,
	cmd = cmd,
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = cmd
	end,
})
