return {
	"mfussenegger/nvim-dap",
	lazy = true,
	config = function()
		local dap = require("dap")
		require("overseer").enable_dap()

		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

		-- Set up rust debugging
		dap.adapters.lldb = {
			type = "executable",
			command = "/run/current-system/sw/bin/lldb-dap", -- adjust as needed, must be absolute path
			name = "lldb",
		}
		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
		}

		dap.adapters.firefox = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/bin/dap-adapters/vscode-firefox-debug/dist/adapter.bundle.js" },
		}

		local firefoxPath = "/usr/bin/firefox"

		-- Check if running on nixos
		if os.execute("command -v nix") == 0 then
			firefoxPath = "/run/current-system/sw/bin/firefox"
		end

		dap.configurations.typescript = {
			{
				name = "Debug with Firefox",
				type = "firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				firefoxExecutable = firefoxPath,
			},
		}

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				initCommands = function()
					-- Find out where to look for the pretty printer Python module
					local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

					local script_import = 'command script import "'
						.. rustc_sysroot
						.. '/lib/rustlib/etc/lldb_lookup.py"'
					local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

					local commands = {}
					local file = io.open(commands_file, "r")
					if file then
						for line in file:lines() do
							table.insert(commands, line)
						end
						file:close()
					end
					table.insert(commands, 1, script_import)

					return commands
				end,
				-- 💀
				-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
				--
				--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
				--
				-- Otherwise you might get the following error:
				--
				--    Error on launch: Failed to attach to the target process
				--
				-- But you should be aware of the implications:
				-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
				-- runInTerminal = false,
			},
		}

		dap.configurations.c = {
			{
				name = "Attach to running process (lldb)",
				type = "lldb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to lldbserver",
				type = "lldb",
				request = "attach",
				target = function()
					-- Default to localhost:1234, but allow override
					return vim.fn.input("gdbserver target: ", "localhost:1234", "file")
				end,
				program = function()
					-- Get current buffer info
					local current_file = vim.fn.expand("%:p") -- Full path of current file
					local current_dir = vim.fn.expand("%:p:h") -- Directory of current file
					local file_name = vim.fn.expand("%:t:r") -- Filename without extension

					-- Check if we're editing a C/C++ file
					local is_c_file = current_file:match("%.c$")
						or current_file:match("%.cpp$")
						or current_file:match("%.cc$")

					if is_c_file then
						-- First, try to find the executable in common build locations
						local possible_paths = {
							"./" .. file_name, -- Same directory as source
							"./build/" .. file_name, -- Common build directory
							current_dir .. "/" .. file_name, -- Same dir as source file
							"./debug/" .. file_name, -- Debug build directory
							"./out/" .. file_name, -- Another common location
						}

						-- Check if any of these exist
						for _, path in ipairs(possible_paths) do
							if vim.fn.filereadable(path) == 1 then
								return path
							end
						end

						-- If no existing binary found, suggest a name based on current file
						local suggested_path = "./" .. file_name
						return vim.fn.input("Path to executable: ", suggested_path, "file")
					else
						-- Not a C file, just use normal file input
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end
				end,
			},
			cwd = "${workspaceFolder}",
		}
	end,
	keys = {
		{
			"<leader>dc",
			":lua require('dap').continue()<CR>",
			desc = "DAP Continue",
		},
		{
			"<leader>do",
			":lua require('dap').step_over()<CR>",
			desc = "DAP Step over",
		},
		{
			"<leader>di",
			":lua require('dap').step_into()<CR>",
			desc = "DAP Step into",
		},
		{
			"<leader>dO",
			":lua require('dap').step_out()<CR>",
			desc = "DAP Step out",
		},
		{
			"<leader>db",
			":lua require('dap').toggle_breakpoint()<CR>",
			desc = "DAP Toggle breakpoint",
		},
		{
			"<leader>dB",
			":lua require('dap').set_breakpoint()<CR>",
			desc = "DAP Set breakpoint",
		},
		{
			"<leader>dr",
			":lua require('dap').repl.open()<CR>",
			desc = "DAP Open REPL",
		},
		{
			"<leader>du",
			":lua require('dapui').toggle()<CR>",
			desc = "Toggle DAP UI",
		},
	},
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = true,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			config = true,
		},
		{
			"mfussenegger/nvim-dap-python",
			ft = "python",
		},
		{
			"mxsdev/nvim-dap-vscode-js",
		},
		{
			"nvim-neotest/nvim-nio",
		},
	},
}
