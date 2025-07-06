-- Lazy.nvim Bootstrap and Plugin Setup
local conf_path = vim.fn.stdpath("config") --[[@as string]]

-- Lazy.nvim setup
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		-- -- { import = "irfash.plugins.ui" },
		{ import = "plugins.lsp" },
		-- { import = "plugins.cmp" },
		-- {import = "plugins.mini"}
		-- {
		--     name = "options",
		--     event = "VeryLazy",
		--     dir = lazypath,
		--     config = function()
		--       -- require("opts").final()
		--       require("core.keymaps").general()
		--       -- require("mappings").misc()
		--     end,
		--   },

		-- { import = "irfash.plugins.performance" },
	}, -- Import plugin specifications
	defaults = {
		lazy = true, -- Lazy-load plugins by default
		version = false, -- Always use the latest version
	},
	install = {
		missing = true, -- Auto-install missing plugins
	},
	performance = {
		cache = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/lazy",
		},
		rtp = {
			disabled_plugins = { -- Disable unused built-in plugins for better performance
				"gzip",
				"matchit",
				"matchparen",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = "rounded", -- Rounded borders for UI
	},
})
