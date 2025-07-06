return {
	{
		-- Core Treesitter Plugin
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"bash",
				"c",
				"javascript",
				"json",
				"lua",
				"python",
				"typescript",
				"html",
				"css",
				"tsx",
				"markdown",
				"yaml",
				-- "dotenv",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					node_decremental = "<BS>",
					scope_incremental = false,
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- local wk = require("which-key")
			-- wk.register({
			-- 	{ "<BS>", group = "Decrement Selection", mode = { "n", "x" } },
			-- 	{ "<C-space>", group = "Increment Selection", mode = { "n", "x" } },
			-- })
			-- Which-key integration
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		config = function()
			require("treesitter-context").setup({
				enable = false, -- Enable the plugin
				max_lines = 5, -- Maximum lines to show in the context
				trim_scope = "outer", -- Trim the outermost context if max_lines are exceeded
				mode = "topline", -- Display context at the top of the window
				separator = "─", -- Line separator
				zindex = 20, -- Ensure it appears above other UI elements
			})
		end,
	},
	{
		-- Treesitter Textobjects
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		enabled = false,
		ft = { "lua", "python", "javascript", "typescript" },
		opts = {
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		-- Auto-closing Tags
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {
			filetypes = { "html", "xml", "javascript", "typescript", "jsx", "tsx" },
		},
	},
}
