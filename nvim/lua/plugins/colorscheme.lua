return {
	{
		"olimorris/onedarkpro.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		init = function()
			-- require("legendary").commands({
			-- 	{
			-- 		":OnedarkproCache",
			-- 		description = "Cache the theme",
			-- 	},
			-- 	{
			-- 		":OnedarkproClean",
			-- 		description = "Clean the theme cache",
			-- 	},
			-- 	{
			-- 		":OnedarkproColors",
			-- 		description = "Show the theme's colors",
			-- 	},
			-- })
		end,
		optst = {
			colors = {
				dark = {
					-- indent_line = "#BB9AF7", -- Dark gray for regular indent lines
					indent_line = "#3B4048", -- Dark gray for regular indent lines
					context_purple = "#BB9AF7", -- Purple for context indent line
					context_start_underline = "#BB9AF7", -- Underline color for context start
					statusline_bg = "#2e323b", -- gray
					-- purple = "#bb9af7",
					purple = "require('onedarkpro.helpers').lighten('blue', 10, 'onedark')",
					statuscolumn_border = "#4b5160", -- gray
					ellipsis = "#808080", -- gray
					telescope_prompt = "require('onedarkpro.helpers').darken('bg', 1, 'onedark')",
					telescope_results = "require('onedarkpro.helpers').darken('bg', 4, 'onedark')",
					telescope_preview = "require('onedarkpro.helpers').darken('bg', 6, 'onedark')",
					telescope_selection = "require('onedarkpro.helpers').darken('bg', 8, 'onedark')",
					-- copilot = "require('onedarkpro.helpers').darken('gray', 8, 'onedark')",
					breadcrumbs = "require('onedarkpro.helpers').darken('gray', 10, 'onedark')",
					local_highlight = "require('onedarkpro.helpers').lighten('bg', 4, 'onedark')",
					light_gray = "require('onedarkpro.helpers').darken('gray', 7, 'onedark')",
				},
				light = {
					comment = "#bebebe", -- Revert back to original comment colors
					statusline_bg = "#f0f0f0", -- gray
					statuscolumn_border = "#e7e7e7", -- gray
					ellipsis = "#808080", -- gray
					git_add = "require('onedarkpro.helpers').get_preloaded_colors('onelight').green",
					git_change = "require('onedarkpro.helpers').get_preloaded_colors('onelight').yellow",
					git_delete = "require('onedarkpro.helpers').get_preloaded_colors('onelight').red",
					telescope_prompt = "require('onedarkpro.helpers').darken('bg', 2, 'onelight')",
					telescope_results = "require('onedarkpro.helpers').darken('bg', 5, 'onelight')",
					telescope_preview = "require('onedarkpro.helpers').darken('bg', 7, 'onelight')",
					telescope_selection = "require('onedarkpro.helpers').darken('bg', 9, 'onelight')",
					-- copilot = "require('onedarkpro.helpers').lighten('gray', 8, 'onelight')",
					breadcrumbs = "require('onedarkpro.helpers').lighten('gray', 8, 'onelight')",
					local_highlight = "require('onedarkpro.helpers').darken('bg', 5, 'onelight')",
					light_gray = "require('onedarkpro.helpers').lighten('gray', 10, 'onelight')",
				},
			},
			highlights = {

				-- Regular indent lines
				IndentBlanklineChar = { fg = "${indent_line}", italic = true },
				ndentBlanklineContextChar = { fg = "${context_purple}", bold = true },

				-- Underline the start of the current indent context
				IndentBlanklineContextStart = { fg = "${context_start_underline}", underline = true },

				-- Optional: Additional indentation-related highlights
				-- IblIndent = { fg = "${indent_line}", bold = true },

				CodeCompanionVirtualText = { fg = "${gray}", italic = true },

				-- ["@markup.raw.block.markdown"] = { bg = "${codeblock}" },
				-- ["@markup.quote.markdown"] = { italic = true, extend = true },

				-- EdgyNormal = { bg = "${bg}" },
				-- EdgyTitle = { fg = "${purple}", bold = true },

				EyelinerPrimary = { fg = "${green}" },
				EyelinerSecondary = { fg = "${blue}" },

				NormalFloat = { bg = "${bg}" }, -- Set the terminal background to be the same as the editor
				FloatBorder = { fg = "${gray}", bg = "${bg}" },

				CursorLineNr = { bg = "${bg}", fg = "${fg}", italic = true },
				LocalHighlight = { bg = "${local_highlight}" },
				MatchParen = { fg = "${cyan}" },
				ModeMsg = { fg = "${gray}" }, -- Make command line text lighter
				Search = { bg = "${selection}", fg = "${yellow}", underline = true },
				VimLogo = { fg = { dark = "#81b766", light = "#029632" } },

				-- Aerial plugin
				AerialClass = { fg = "${purple}", bold = true, italic = true },
				AerialClassIcon = { fg = "${purple}" },
				AerialConstructorIcon = { fg = "${yellow}" },
				AerialEnumIcon = { fg = "${blue}" },
				AerialFunctionIcon = { fg = "${blue}" },
				AerialInterfaceIcon = { fg = "${orange}" },
				AerialMethodIcon = { fg = "${green}" },
				AerialObjectIcon = { fg = "${purple}" },
				AerialPackageIcon = { fg = "${fg}" },
				AerialStructIcon = { fg = "${cyan}" },
				AerialVariableIcon = { fg = "${orange}" },

				-- Telescope
				-- TelescopeBorder = {
				-- 	fg = "${telescope_results}",
				-- 	bg = "${telescope_results}",
				-- },
				TelescopePromptPrefix = {
					fg = "${gray}",
				},
				-- TelescopePromptBorder = {
				-- 	fg = "${telescope_prompt}",
				-- 	bg = "${telescope_prompt}",
				-- },
				-- TelescopePromptCounter = { fg = "${fg}" },
				-- TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
				-- TelescopePromptTitle = {
				-- 	fg = "${telescope_prompt}",
				-- 	bg = "${gray}",
				-- 	bold = true,
				-- },
				-- TelescopePreviewTitle = {
				-- 	fg = "${telescope_results}",
				-- 	bg = "${green}",
				-- },
				-- TelescopeSelectionCaret = { fg = "${fg}", bold = true },
				--
				-- TelescopeResultsTitle = {
				-- 	fg = "${telescope_results}",
				-- 	bg = "${telescope_results}",
				-- },
				-- TelescopeMatching = { fg = "${blue}" },
				-- TelescopeNormal = { bg = "${telescope_results}", fg = "NONE" },
				-- TelescopeSelection = { bg = "${telescope_selection}", bold = true },
				-- TelescopePreviewNormal = { bg = "${telescope_preview}" },
				-- TelescopePreviewBorder = { fg = "${telescope_preview}", bg = "${telescope_preview}" },
			},
			-- caching = false,
			cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_dotfiles"),

			plugins = {
				barbar = false,
				lsp_saga = false,
				marks = false,
				polygot = false,
				startify = false,
				telescope = false,
				trouble = false,
				vim_ultest = false,
				which_key = false,
			},
			styles = {
				tags = "italic",
				methods = "bold",
				functions = "bold",
				keywords = "italic",
				comments = "italic",
				parameters = "italic",
				conditionals = "italic",
				virtual_text = "italic",
			},
			options = {
				cursorline = true,
				transparency = true,
				-- transparency = _G.is_transparent,
				-- highlight_inactive_windows = true,
			},
		},
		opts = {
			colors = {
				-- Replace base purple with sky blue
				-- purple = "#00A3CC", -- Sky blue
				sky_blue = "#00A3CC", -- Sky blue (consistent with purple)
				gray = "#5C6370", -- Neutral gray
				-- plugin specific
				telescope_selection = "require('onedarkpro.helpers').darken('bg', 2, 'onedark')",
			},
			highlights = {
				--Syntex

				-- Commen
				CursorLineNr = {
					fg = "#79C0FF",
				},
				-- Cursor = { bg = "#7A869A" },
				Comment = { fg = "#7A869A", italic = true },
				CursorLine = { bg = "#2A2E37" },

				-- plugins
				--
				--NoeTree
				-- NeoTreeNormalNC = { -- Color when nvim-tree is no longer in focus
				--     bg = config.options.transparency and "NONE"
				--         or (config.options.highlight_inactive_windows and theme.generated.color_column or theme.palette.bg),
				-- },
				-- NeoTreeSymbolicLinkTarget = { fg = theme.palette.cyan },
				-- NeoTreeDirectoryName = { fg = theme.palette.blue },
				NeoTreeDirectoryIcon = { fg = "#79C0FF" },
				NeoTreeRootName = { fg = "#79C0FF" },
				-- NeoTreeFileIcon = { fg = theme.palette.blue },
				-- NeoTreeFileName = { fg = theme.palette.fg },
				NeoTreeFileNameOpened = { fg = "#79C0FF" },
				-- NeoTreeIndentMarker = { fg = theme.palette.gray },

				NeoTreeTitleBar = { bg = "#79C0FF" },
				NeoTreeFloatTitle = { bg = "#79C0FF" },

				-- NeoTreeTitleBar = { fg = theme.palette.bg, bg = "#79C0FF" },
				-- NeoTreeFloatTitle = { fg = theme.palette.bg, bg = "#79C0FF" },
				-- NeoTreeGitAdded = { fg = theme.palette.green },
				-- NeoTreeGitConflict = { fg = theme.palette.blue },
				-- NeoTreeGitDeleted = { fg = theme.palette.red },
				-- NeoTreeGitModified = { fg = theme.palette.yellow },
				-- NeoTreeGitIgnored = { fg = theme.palette.gray },
				-- NeoTreeGitUntracked = { fg = theme.palette.gray },
				-- NeoTreeModified = { fg = theme.palette.red },
				--
				--IBL
				IblIndent = { fg = "#4B5263" },
				IblScope = { fg = "#79C0FF", bold = true },
				-- Soft Blue-Grey: #7A869A
				-- Light Steel Blue: #A0AEC0
				-- Muted Sky Blue: #8DA6CE
				-- #2A2E37
				-- Telescope
				TelescopeSelection = {
					bg = "${telescope_selection}",
					fg = "white",
				},
				TelescopeSelectionCaret = { fg = "white" },
				-- TelescopeMultiSelection = {
				--     fg = theme.palette.gray,
				-- },
				-- TelescopeNormal = {
				--     fg = theme.palette.fg,
				-- },
				-- TelescopeBorder = {
				--     fg = theme.palette.gray,
				-- -- },
				-- TelescopePromptNormal = { link = "TelescopeNormal" },
				-- TelescopePromptBorder = { link = "TelescopeBorder" },
				-- TelescopePreviewBorder = { link = "TelescopeBorder" },
				TelescopePromptPrefix = { fg = "${white}" },
				-- TelescopeMatching = { fg = theme.palette.green },
			},
			options = {
				cursorline = true,
				transparency = true,
				terminal_colors = false,
			},
		},
		config = function(_, opts)
			require("onedarkpro").setup(opts)

			if vim.o.background == "light" then
				vim.cmd([[colorscheme onelight]])
			else
				vim.cmd([[colorscheme onedark]])
			end
		end,
	},
}
-- TabLineSel = { bg = "#00A3CC" }, -- tab pages line, active tab page label
-- TermCursor = { bg = "#00A3CC" }, -- curs
