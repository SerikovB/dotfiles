return {
        "hrsh7th/nvim-cmp",
        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                'saadparwaiz1/cmp_luasnip',
        },
        config = function()
                local cmp = require('cmp')
                require('luasnip.loaders.from_vscode').lazy_load()
                cmp.setup({
                        formatting = {
                                fields = { 'menu', 'abbr', 'kind' },
                                format = function(entry, item)
                                        local menu_icon = {
                                                nvim_lsp = 'λ',
                                                luasnip = '⋗',
                                                buffer = 'Ω',
                                                path = '🖫',
                                                nvim_lua = 'Π',
                                        }
                                        item.menu = menu_icon[entry.source.name]
                                        return item
                                end,
                        },
                        sources = {
                                { name = 'nvim_lsp' },
                                { name = 'luasnip' },
                                { name = 'path' },
                                { name = 'buffer' },
                                { name = 'nvim_lua' },
                        },
                        mapping = cmp.mapping.preset.insert({
                                -- Ctrl + (n or p) for next or previous item
                                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

                                -- Enter to confirm
                                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                                -- Ctrl + Space to trigger completion menu
                                ['<C-Space>'] = cmp.mapping.complete(),

                                -- Ctrl + (u or d) to scroll up or down in the completion documentation
                                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                                -- Luasnip
                                ['<C-f>'] = cmp.mapping(function(fallback)
                                        local luasnip = require('luasnip')
                                        if luasnip.locally_jumpable(1) then
                                                luasnip.jump(1)
                                        else
                                                fallback()
                                        end
                                end, { 'i', 's' }),
                                ['<C-b>'] = cmp.mapping(function(fallback)
                                        local luasnip = require('luasnip')
                                        if luasnip.locally_jumpable(-1) then
                                                luasnip.jump(-1)
                                        else
                                                fallback()
                                        end
                                end, { 'i', 's' }),

                                -- Super tab
                                --[[ ['<Tab>'] = cmp.mapping(function(fallback)
                                        local luasnip = require('luasnip')
                                        local col = vim.fn.col('.') - 1

                                        if cmp.visible() then
                                                cmp.select_next_item({ behavior = 'select' })
                                        elseif luasnip.expand_or_locally_jumpable() then
                                                luasnip.expand_or_jump()
                                        elseif col == 0 or vim.fn.getline(','):sub(col, col):match('%s') then
                                                fallback()
                                        else
                                                cmp.complete()
                                        end
                                end, { 'i', 's' }),

                                ['<S-Tab>'] = cmp.mapping(function(fallback)
                                        local luasnip = require('luasnip')

                                        if cmp.visible() then
                                                cmp.select_prev_item({ behavior = 'select' })
                                        elseif luasnip.locally_jumpable(-1) then
                                                luasnip.jump(-1)
                                        else
                                                fallback()
                                        end
                                end, { 'i', 's' }), ]]
                        }),
                        snippet = {
                                expand = function(args)
                                        require('luasnip').lsp_expand(args.body)
                                end,
                        },
                })
        end,
}
