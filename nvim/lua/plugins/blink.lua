return {
	"saghen/blink.cmp",
	version = "*",
	event = { "LspAttach" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = { preset = "enter" },
		-- Experimental signature help support
		signature = { enabled = true },

		appearance = {},
		sources = {
			--Todo - cmd -> source
			-- cmdline = { enabled = false },
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
				},
				buffer = {
					name = "Buffer",
					module = "blink.cmp.sources.buffer",
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
				},
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
				},
			},
			-- providers = {
			--   lazydev = {
			--     name = "LazyDev",
			--     module = "lazydev.integrations.blink",
			--     score_offset = 100,
			--   },
			-- },
		},
		completion = {
			-- Disable auto brackets
			-- NOTE: some LSPs may add auto brackets themselves anyway
			accept = { auto_brackets = { enabled = true } },
			ghost_text = { enabled = true },
			menu = {
				-- border = vim.g.border_style,
				scrolloff = 1,
				scrollbar = false,
				draw = { treesitter = { "lsp" } },
			},
			documentation = {
				auto_show_delay_ms = 100,
				auto_show = true,
				window = {
					-- border = vim.g.border_style,
				},
			},
		},
	},
}
