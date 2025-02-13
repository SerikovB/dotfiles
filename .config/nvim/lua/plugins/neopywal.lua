return {
        "RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
                local neopywal = require("neopywal")
                neopywal.setup({
                        transparent_background = true,
                        styles = {
                                comments = { "italic" },
                                conditionals = { "italic" },
                                loops = {},
                                functions = {},
                                keywords = {},
                                includes = { "italic" },
                                strings = {},
                                variables = { "italic" },
                                numbers = {},
                                booleans = {},
                                types = { "italic" },
                                operators = {},
                        },
                })
                vim.cmd.colorscheme("neopywal")
        end
}
