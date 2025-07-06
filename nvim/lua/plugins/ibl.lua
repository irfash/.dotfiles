return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		require("ibl").setup({
			-- char_highlight_list = {
			-- 	"IndentBlanklineChar", -- Regular indent line color
			-- },
			indent = {
				char = require("icons").misc.vertical_bar,
				smart_indent_cap = true,
				repeat_linebreak = true,
				priority = 2,
			},
			whitespace = {
				highlight = { "Function", "Label", "Whitespace", "NonText" },
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				show_exact_scope = false,
				injected_languages = true,
				highlight = "IblScope",
				-- highlight = { "Function", "Label", "Type", "Keyword" },
				priority = 500,
				include = {
					node_type = {
						lua = { "function", "table_constructor", "chunk" },
						python = { "module", "function_definition" },
					},
				},
				exclude = {
					language = { "rust" },
					node_type = { lua = { "block", "chunk" }, python = { "module" } },
				},
			},
			exclude = {
				filetypes = { "help", "gitcommit", "packer", "TelescopePrompt", "TelescopeResults" },
				buftypes = { "nofile", "terminal", "prompt" },
			},
			-- viewport_buffer = {
			-- 	min = 30,
			-- 	max = 100,
			-- },
		})
	end,
}
