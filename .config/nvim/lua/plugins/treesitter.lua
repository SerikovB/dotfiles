return {
	"nvim-treesitter/nvim-treesitter",
	enable = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"go",
				"tsx",
				"cpp",
				"lua",
				"nix",
				"yaml",
				"json",
				"cmake",
				"python",
				"typescript",
				"javascript",
			},
			ignore_install = {},
			highlight = {
				enable = true,
				disable = { "help" },
			},
			indent = {
				enable = true,
			},
                        incremental_selection = {
                                enable = true,
                                keymaps = {
                                        init_selection = "gnn", -- set to `false` to disable one of the mappings
                                        node_incremental = "grn",
                                        scope_incremental = "grc",
                                        node_decremental = "grm",
                                },
                        },
		})
	end,
}
