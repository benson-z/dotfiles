-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--     local opts = {buffer = bufnr, remap = false}
--
--     vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     vim.keymap.set("n", "<leader>b", function() vim.lsp.buf.references() end, opts)
--     vim.keymap.set("n", "<leader>mv", function() vim.lsp.buf.rename() end, opts)
-- end)
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = {'rust_analyzer', 'jedi_language_server', 'jdtls'},
--     handlers = {
--         lsp_zero.default_setup,
--         lua_ls = function()
--             local lua_opts = lsp_zero.nvim_lua_ls()
--             require('lspconfig').lua_ls.setup(lua_opts)
--         end,
--     }
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
-- cmp.setup({
--     sorting = {
--         comparators = {
--             cmp.config.compare.offset,
--             cmp.config.compare.exact,
--             cmp.config.compare.score,
--             cmp.config.compare.recently_used,
--             cmp.config.compare.locality,
--             cmp.config.compare.kind,
--             cmp.config.compare.sort_text,
--             cmp.config.compare.length,
--             cmp.config.compare.order,
--         }
--     },
--     sources = {
--         {name = 'path'},
--         {name = 'nvim_lsp'},
--         {name = 'nvim_lua'},
--     },
--     formatting = lsp_zero.cmp_format(),
--     preselect = cmp.PreselectMode.Item,
--     completion = {
--         completeopt = 'menu,menuone,noinsert'
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<S-tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
--         ['<tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
--         ['<cr>'] = cmp.mapping.confirm({ select = true }),
--     }),
-- })
