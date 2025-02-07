return {
        "neovim/nvim-lspconfig",

        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
                local lspc = require("lspconfig") local lspc_default = lspc.util.default_config
                lspc_default.capabilities = vim.tbl_deep_extend(
                        'force',
                        lspc_default.capabilities,
                        require('cmp_nvim_lsp').default_capabilities()
                )

                -- Language server configuration
                lspc.lua_ls.setup({
                        on_init = function(client)
                                if client.workspace_folders then
                                        local path = client.workspace_folders[1].name
                                        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                                                return
                                        end
                                end

                                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                        runtime = {
                                                version = 'LuaJIT',
                                        },
                                        workspace = {
                                                checkThirdParty = false,
                                                library = {
                                                        vim.env.VIMRUNTIME,
                                                },
                                        },
                                })
                        end,
                        settings = {
                                Lua = {},
                        },
                })

                lspc.nil_ls.setup({
                        cmd = { 'nil', },
                        filetypes = { 'nix', },
                        settings = {
                                ['nil'] = {
                                        formatting = {
                                                command = { "nix fmt" },
                                        },
                                },
                        },
                })
                lspc.clangd.setup({})
                lspc.cmake.setup({})
                lspc.ts_ls.setup({})
        end,
}
