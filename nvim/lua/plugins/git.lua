return {
	{
		'TimUntersberger/neogit',

		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
		},

		opts = {
			integrations = {
				diffview = true,
			}
		}
	}
}
