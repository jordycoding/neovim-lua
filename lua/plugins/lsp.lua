local cmp = require("cmp")
local lspconfig = require("lspconfig")
local lspkind = require("lspkind")
local configs = require("lspconfig.configs")
local lspconfig_util = require("lspconfig.util")
local navic = require("nvim-navic")
local pid = vim.fn.getpid()

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs( -4), { "i", "c" }),
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
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
        { name = "nvim_lsp_signature_help" },
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = "path" },
    }, {
        { name = "buffer" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "text_symbol",
            maxwidth = 50,
            before = function(entry, vim_item)
                return vim_item
            end,
        }),
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
    if client.server_capabilities.colorProvider then
        require("document-color").buf_attach(bufnr)
    end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers =
{ "tsserver", "pyright", "bashls", "ansiblels", "nil_ls", "rust_analyzer", "tailwindcss", "cssls", "html", "phpactor", "docker_compose_language_service", "dockerls", "svelte"}
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
    env = { DOTNET_ROOT = os.getenv("DOTNET_ROOT") }
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
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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

require("lspconfig")["tsserver"].setup({
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,
            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = true,
            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
            -- inlay hints
            auto_inlay_hints = false,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },
            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        })

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
        client.server_capabilities.document_formatting = false
    end,
})

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.nixpkgs_fmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.checkstyle.with({
            extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
        }),
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.csharpier,
    },
    on_attach = on_attach,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        package.loaded["feline"] = nil
        package.loaded["catppuccin.groups.integrations.feline"] = nil
        require("feline").setup({
            components = require("catppuccin.groups.integrations.feline").get(),
        })
    end,
})
