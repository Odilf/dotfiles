return {
	-- TODO: Use [proximity-sort](https://github.com/jonhoo/proximity-sort)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({})
			telescope.load_extension("frecency")
			telescope.load_extension("fzf")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	{
		event = "BufRead",
		"Pocco81/auto-save.nvim",
		opts = {
			trigger_events = { "InsertLeave" },
		}
	},

	-- Search and replace in multiple files
	{
		"windwp/nvim-spectre",
	},
}
