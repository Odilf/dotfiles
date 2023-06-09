return {
	{
		"nvim-telescope/telescope.nvim",
    dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua",
		},
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
		opts = {
			filesystem = {
				follow_current_file = true,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
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
    -- keys = {
    --   { "<leader>sr", , desc = "Replace in files (Spectre)" },
    -- },
  },
}

