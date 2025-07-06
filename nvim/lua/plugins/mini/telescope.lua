return {
{
		"nvim-telescope/telescope.nvim",
event = "VimEnter",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
		},

		config = function()
			local telescope = require("telescope")
			-- print("ioda")
			telescope.setup({
				defaults = {
					-- Appearance
					entry_prefix = "  ",
					prompt_prefix = "   ",
					selection_caret = "  ",
					color_devicons = true,
					path_display = { "smart" },
					dynamic_preview_title = true,

					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							-- height = om.on_big_screen() and 0.6 or 0.95,
							preview_width = 0.55,
							prompt_position = "top",
							width = 0.9,
						},
						center = {
							anchor = "N",
							width = 0.9,
							preview_cutoff = 10,
						},
						vertical = {
							-- height = om.on_big_screen() and 0.4 or 0.9,
							preview_height = 0.3,
							width = 0.9,
							preview_cutoff = 10,
							prompt_position = "top",
						},
					},

					-- Searching
					-- set_env = { COLORTERM = "truecolor" },
					file_ignore_patterns = {
						".git/",
						"%.jpg",
						"%.jpeg",
						"%.png",
						"%.svg",
						"%.otf",
						"%.ttf",
						"%.lock",
						"__pycache__",
						"%.sqlite3",
						"%.ipynb",
						"vendor",
						"node_modules",
						"dotbot",
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,

					-- Mappings
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
							-- ["<C-e>"] = custom_actions.multi_select,
							["<C-c>"] = require("telescope.actions").delete_buffer,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-d>"] = require("telescope.actions").preview_scrolling_down,
							["<C-f>"] = require("telescope.actions").preview_scrolling_up,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
							["<C-q>"] = require("telescope.actions").send_to_qflist,
                ["<C-r>"] = function(prompt_bufnr)
          local current_prompt = require('telescope.actions.state').get_current_line()
          -- Toggle between fuzzy and regex search modes
          if current_prompt:match("[^\\]*\\v.*") then
            require('telescope.actions').close(prompt_bufnr)  -- close the current session
            vim.cmd("Telescope live_grep search=" .. current_prompt)  -- start with regex search
          else
            -- Turn it into a fuzzy search
            require('telescope.actions').close(prompt_bufnr)
            vim.cmd("Telescope live_grep search=" .. current_prompt)  -- re-run with fuzzy search
          end
        end,
						},
						n = {
							["q"] = require("telescope.actions").close,
							["<C-n>"] = require("telescope.actions").move_selection_next,
							["<C-p>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},

				extensions = {
					frecency = {
						show_scores = false,
						show_unindexed = false,
						ignore_patterns = {
							"*.git/*",
							"*/tmp/*",
							"*/node_modules/*",
							"*/vendor/*",
						},
						-- workspaces = {
						--   ["nvim"] = os.getenv("HOME_DIR") .. ".config/nvim",
						--   ["dots"] = os.getenv("HOME_DIR") .. ".dotfiles",
						--   ["project"] = os.getenv("PROJECT_DIR"),
						-- },
					},
					-- fzf = {
					-- 	fuzzy = true,
					-- 	override_generic_sorter = false,
					-- 	override_file_sorter = true,
					-- 	case_mode = "smart_case",
					-- },
					-- undo = {
					--   mappings = {
					--     i = {
					--       ["<CR>"] = require("telescope-undo.actions").restore,
					--       ["<C-a>"] = require("telescope-undo.actions").yank_additions,
					--       ["<C-d>"] = require("telescope-undo.actions").yank_deletions,
					--     },
					--   },
					-- },
				},
			})
			-- require("telescope").load_extension("fzf")
          vim.api.nvim_set_keymap('n', '<leader>tf', ":Telescope find_files<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tg', ":Telescope live_grep<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tb', ":Telescope buffers<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>th', ":Telescope help_tags<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>to', ":Telescope oldfiles<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>td', ":Telescope diagnostics<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tl', ":Telescope file_browser<CR>", { noremap = true, silent = true })

		end,
	},
}
-- {
--   "telescope.nvim",
--   config = function()
--     -- Keymaps for various search actions in Telescope
--     vim.api.nvim_set_keymap('n', '<leader>ff', ":Telescope find_files<CR>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>fg', ":Telescope live_grep<CR>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>fb', ":Telescope buffers<CR>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>fo', ":Telescope oldfiles<CR>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>fd', ":Telescope diagnostics<CR>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap('n', '<leader>fl', ":Telescope file_browser<CR>", { noremap = true, silent = true })
--   end,
-- },
--
