return {
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', 
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
        config = function()
            require("telescope").load_extension("projects")
        end
	}
}
