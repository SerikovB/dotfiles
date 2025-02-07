return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				wrap_results = false,
				prompt_prefix = " 󰭎  ",
				selection_caret = "  ",
				entry_prefix = "  ",
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {
						["q"] = "close",
					},
				},
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
						results_width = 0.6,
					},
					width = 0.85,
					height = 0.70,
					preview_cutoff = 120,
				},
			},
		})
	end,
}
