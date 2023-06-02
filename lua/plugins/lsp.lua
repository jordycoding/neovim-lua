local cmp = require("cmp")
local lspconfig = require("lspconfig")
local lspkind = require("lspkind")
local configs = require("lspconfig.configs")
local lspconfig_util = require("lspconfig.util")
local navic = require("nvim-navic")
local pid = vim.fn.getpid()
local types = require("cmp.types")
local luasnip = require("luasnip")
local rt = require("rust-tools")

local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return false
	end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return true
	end
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			deprioritize_snippet,
			-- the rest of the comparators are pretty much the defaults
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.scopes,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		-- { name = "vsnip" }, -- For vsnip users.
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				symbol_map = { Copilot = "" },
				before = function(entry, vim_item)
					vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
					return vim_item
				end,
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},
	experimental = {
		ghost_text = true,
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.colorProvider = {
	dynamicRegistration = true,
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
        augroup END
        ]])
	end
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	"pyright",
	"bashls",
	"ansiblels",
	"nil_ls",
	"tailwindcss",
	"cssls",
	"html",
	"docker_compose_language_service",
	"dockerls",
	"svelte",
	"texlab",
	"eslint",
	"prismals",
	"angularls",
	"emmet_ls",
}
for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = on_attach,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
end

-- C# stuff
local omnisharp_bin = "/run/current-system/sw/bin/OmniSharp"
require("lspconfig")["omnisharp"].setup({
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	env = { DOTNET_ROOT = os.getenv("DOTNET_ROOT") },
})

-- Vue stuff
local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = lspconfig_util.root_pattern("package.json")

local function on_new_config(new_config, new_root_dir)
	local function get_typescript_server_path(root_dir)
		local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
		return project_root
				and (lspconfig_util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js"))
			or ""
	end

	if
		new_config.init_options
		and new_config.init_options.typescript
		and new_config.init_options.typescript.serverPath == ""
	then
		new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
	end
end

configs.volar_api = {
	default_config = {
		cmd = volar_cmd,
		root_dir = volar_root_dir,
		on_new_config = on_new_config,
		filetypes = { "vue" },
		-- If you want to use Volar's Take Over Mode (if you know, you know)
		--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
		init_options = {
			typescript = {
				serverPath = "",
			},
			languageFeatures = {
				implementation = true, -- new in @volar/vue-language-server v0.33
				references = true,
				definition = true,
				typeDefinition = true,
				callHierarchy = true,
				hover = true,
				rename = true,
				renameFileRefactoring = true,
				signatureHelp = true,
				codeAction = true,
				workspaceSymbol = true,
				completion = {
					defaultTagNameCase = "both",
					defaultAttrNameCase = "kebabCase",
					getDocumentNameCasesRequest = false,
					getDocumentSelectionRequest = false,
				},
			},
		},
	},
}
lspconfig.volar_api.setup({})

configs.volar_doc = {
	default_config = {
		cmd = volar_cmd,
		root_dir = volar_root_dir,
		on_new_config = on_new_config,
		filetypes = { "vue" },
		-- If you want to use Volar's Take Over Mode (if you know, you know):
		--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
		init_options = {
			typescript = {
				serverPath = "",
			},
			languageFeatures = {
				implementation = true, -- new in @volar/vue-language-server v0.33
				documentHighlight = true,
				documentLink = true,
				codeLens = { showReferencesNotification = true },
				-- not supported - https://github.com/neovim/neovim/pull/15723
				semanticTokens = false,
				diagnostics = true,
				schemaRequestService = true,
			},
		},
	},
}
lspconfig.volar_doc.setup({})

configs.volar_html = {
	default_config = {
		cmd = volar_cmd,
		root_dir = volar_root_dir,
		on_new_config = on_new_config,
		filetypes = { "vue" },
		-- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
		--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		init_options = {
			typescript = {
				serverPath = "",
			},
			documentFeatures = {
				selectionRange = true,
				foldingRange = true,
				linkedEditingRange = true,
				documentSymbol = true,
				-- not supported - https://github.com/neovim/neovim/pull/13654
				documentColor = false,
				documentFormatting = {
					defaultPrintWidth = 100,
				},
			},
		},
	},
}
lspconfig.volar_html.setup({})

-- Icons in gutter for linting
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show line diagnostics in hover window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- Disable virtualtext as it doesn't wrap and hovering works better
vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	update_in_insert = true,
})

require("typescript").setup({
	disable_commands = true, -- prevent the plugin from creating Vim commands, doing this via null_ls
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = {
		-- pass options to lspconfig's setup method
		on_attach = on_attach,
		capabilities = capabilities,
	},
})

-- Yes a paid LSP, phpactor sucks
require("lspconfig").intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<space>ca", rt.hover_actions.hover_actions, { buffer = bufnr })
		end,
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.nixpkgs_fmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.checkstyle.with({
			extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
		}),
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.formatting.black,
		require("typescript.extensions.null-ls.code-actions"),
	},
	on_attach = on_attach,
})
