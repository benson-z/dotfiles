return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = 'if_many',
                prefix = '●',
            },
            severity_sort = true,
            signs = true,
        })

        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set({ 'n', 'x' }, '<leader>cf', function()
                vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            end, opts)
            vim.keymap.set("n", "<leader>cl", function()
                vim.cmd("LspInfo")
            end, opts)
        end

        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = { 'rust_analyzer', 'jedi_language_server', 'jdtls', 'clangd', 'lua_ls' },
        })

        local function setup_server(server_name, opts)
            local config = vim.tbl_deep_extend('force', {
                capabilities = capabilities,
                on_attach = on_attach,
            }, opts or {})

            vim.lsp.config(server_name, config)
        end

        setup_server('rust_analyzer')
        setup_server('jedi_language_server')
        setup_server('clangd')
        setup_server('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        checkThirdParty = false,
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                },
            },
        })
        setup_server('jdtls')

        local cmp = require('cmp')

        cmp.setup({
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                }
            },
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
            },
            preselect = cmp.PreselectMode.Item,
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                ['<cr>'] = cmp.mapping.confirm({ select = true }),
            }),
        })
    end
}
