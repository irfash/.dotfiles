local opts = {
	defaults = {
		selection_caret = "| ",
		prompt_prefix = "   ",
		color_devicons = true,
		path_display = { "smart" },
		dynamic_preview_title = true,
		layout_strategy = "horizontal",
		-- file_ignore_patterns = { "node_modules", ".git" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		layout_config = {
			prompt_position = "top", -- Places the search bar at the top
		},
		sorting_strategy = "ascending", -- Ensures results appear from top to bottom
	},

	pickers = {
		find_files = {
			previewer = false, -- Disable file preview
		},
		live_grep = {},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup(opts)
			require("core.keymaps").telescope.files()
			require("core.keymaps").telescope.notes()

			telescope.load_extension("fzf") -- Correct extension name
		end,
	},
}
