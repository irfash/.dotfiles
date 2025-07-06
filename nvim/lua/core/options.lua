-- General settings
-- local home = os.getenv("HOME")
-- local session_dir = vim.fn.stdpath("data") .. "/sessions"
local undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.g.mapleader = " " -- Leader key
vim.scriptencoding = "utf-8" -- Script encoding
vim.loader.enable() -- improves startup performance by enabling bytecode caching for Lua files
-- Options setup
local opt = vim.opt
local opts = {}
opts.initial = function()
	-- Encoding
	opt.encoding = "utf-8" -- File encoding
	opt.fileencoding = "utf-8" -- File encoding for buffers

	-- UI settings
	opt.number = true -- Enable line numbers
	opt.relativenumber = true -- Relative line numbers
	opt.cursorline = false -- Highlight the current line
	opt.wrap = false -- Disable line wrapping for performance
	opt.termguicolors = true -- Enable 24-bit colors
	opt.signcolumn = "yes" -- Always show sign column
	opt.scrolloff = 8 -- Keep 8 lines visible when scrolling
	opt.cmdheight = 1 -- Command line height
	opt.showcmd = true -- Show commands in the last line
	opt.laststatus = 3 -- Global status line (better use of space)
	-- opt.winblend = 20
	opt.pumblend = 20 -- Popup blend
	-- Indentation settings
	opt.tabstop = 2 -- Number of spaces per tab
	opt.shiftwidth = 2 -- Indent size for autoindent
	opt.expandtab = true -- Convert tabs to spaces
	opt.autoindent = true -- Auto-indent new lines
	opt.smartindent = true -- Smart indentation

	-- Search settings
	opt.hlsearch = false -- Don't highlight search matches
	opt.incsearch = true -- Highlight matches while typing

	-- Clipboard
	opt.clipboard = "unnamedplus" -- Use system clipboard

	-- Backup and undo
	opt.swapfile = false -- Disable swap file
	opt.backup = false -- Disable backups
	opt.undodir = undodir -- Undo history directory
	opt.undofile = true -- Enable persistent undo

	-- Performance
	opt.updatetime = 300 -- Faster completion
	opt.shortmess:append("c") -- Avoid completion messages
	-- opt.lazyredraw = true                -- Faster macros and scrolling

	-- File behavior
	opt.isfname:append("@-@") -- Allow '@' in file names

	-- Split behavior
	opt.splitright = true -- Open vertical splits to the right
	opt.splitbelow = true -- Open horizontal splits below
	opt.smoothscroll = true
	-- opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
	-- opt.foldmethod = "expr"
	-- opt.foldtext = ""

	-- Add these for a smoother experience
	opt.ignorecase = true -- Case-insensitive searching unless you use \C or capital letters
	opt.smartcase = true -- Do not ignore case with capitals
	opt.mouse = "a" -- Enable mouse support in all modes
	opt.completeopt = "menu,menuone,noselect" -- Set completion options
	-- opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		suffix = "",
		format = function(diagnostic)
			return " " .. diagnostic.message .. " "
		end,
	},
	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "󱐮",
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.INFO] = "◉",
			[vim.diagnostic.severity.WARN] = "",
		},
	},
})

return opts
