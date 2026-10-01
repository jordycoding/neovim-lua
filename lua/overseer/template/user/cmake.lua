local overseer = require("overseer")

return {
	generator = function()
		local cmake = require("cmake-tools")
		if not cmake.is_cmake_project() then
			return {}
		end

		local result = cmake.get_build_targets()
		if not result:is_ok() then
			return "Run :CMakeGenerate to discover CMake build targets"
		end

		local tasks = {}
		for _, target in ipairs(result.data.targets) do
			table.insert(tasks, {
				name = "CMake build: " .. target,
				tags = { overseer.TAG.BUILD },
				builder = function()
					local config = cmake.get_config()
					local args = { "--build" }
					local preset = cmake.get_build_preset()
					if config.base_settings.use_preset and cmake.has_cmake_preset() and preset then
						vim.list_extend(args, { "--preset", preset })
					else
						table.insert(args, cmake.get_build_directory().filename)
					end
					if target ~= "all" then
						vim.list_extend(args, { "--target", target })
					end
					local build_type = cmake.get_build_type()
					if build_type then
						vim.list_extend(args, { "--config", build_type })
					end
					vim.list_extend(args, cmake.get_build_options())

					return {
						cmd = require("cmake-tools.const").cmake_command,
						args = args,
						cwd = config.cwd,
						env = cmake.get_build_environment(),
					}
				end,
			})
		end
		return tasks
	end,
}
