-- local neotree_utils = require("config.neotree")
-- local toggle_or_focus = require("utils").toggle_or_focus
local to_trash = require("utils").to_trash
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Recommended for icons
			"MunifTanjim/nui.nvim",
		},
		enabled = true, -- Enable NeoTree
		keys = {
			-- Toggle NeoTree for the current file
			{
				"<leader>e",
				":Neotree toggle<CR>",
				-- toggle_or_focus,
				desc = "Toggle NeoTree for current file",
			},
			{
				"<leader>o",
				":Neotree focus<CR>",
				desc = "focus NeoTree for current file",
			},
		},
		opts = {
			sources = {
				"filesystem",
				"buffers",
				"git_status",
			},
			filesystem = {
				-- follow_current_file = { enabled = false }, -- Disable auto-following
				commands = {
					-- Custom delete command using the 'trash' utility
					delete = to_trash,
				},
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},
			-- buffers = {
			-- 	follow_current_file = true, -- Focus on the current file's buffer
			-- 	group_empty_dirs = true, -- Group empty directories in buffer view
			-- },
			window = {
				position = "right",
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["g"] = function()
						vim.cmd("Neotree git_status")
					end, -- Open Git status source
					["b"] = function(state)
						vim.cmd("Neotree buffers")
					end,
				},
			},
		},
	},
}
