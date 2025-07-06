-- local project_dir = require("utils").is_in_project_dir()

-- Global Configuration and Environment Setup
local global = vim.g
local M = {}


M.setting = {
  trim_whitespace = true,
	eslint = true,
	format_on_save = true,
}

M.plugins = {

	ibl = true,
	Ccc = true,
	neotree = true,
	rainbow_delimiters = true,
	trouble = true,
}

M.setup_init = function()
	-- global.current_dir = vim.fn.getcwd()
	global.mapleader = " "
	-- global.format_on_save = false
	--	global.loaded_netrw = 1
	global.airline_powerline_fonts = 1
end

M.setup_uni = function()
  global.trim_whitespace = false
	global.eslint = false
	global.format_on_save = false
end

M.setup_minimal = function() end

-- global.eslint = dir_project_uni

-- Define environment variables
-- local os_name = vim.loop.os_uname().sysname
-- global.is_mac = os_name == "Darwin"
-- global.is_linux = os_name == "Linux"
-- global.is_windows = os_name:find("Windows") ~= nil

-- Home directory
-- global.home = os.getenv("HOME") -- Support both Unix and Windows
-- global.config_dir = vim.fn.stdpath("config") -- ~/.config/nvim
-- global.data_dir = vim.fn.stdpath("data")     -- ~/.local/share/nvim
-- global.cache_dir = vim.fn.stdpath("cache")   -- ~/.cache/nvim
-- global.state_dir = vim.fn.stdpath("state")   -- For newer state management in Neovim
--
-- Project Directory
-- global.project_dir = vim.loop.cwd() -- Current working directory (project root)

-- Session Management
-- global.session_dir = global.data_dir .. "/sessions"
-- if not vim.loop.fs_stat(global.session_dir) then
--   vim.fn.mkdir(global.session_dir, "p")
-- end
--
-- Undo History
-- global.undo_dir = global.home .. "/.vim/undodir"
-- if not vim.loop.fs_stat(global.undo_dir) then
--   vim.fn.mkdir(global.undo_dir, "p")
-- end

-- Reusable Utilities
-- global.join_paths = function(...)
--   local path_sep = global.is_windows and "\\" or "/"
--   return table.concat({ ... }, path_sep)
-- end

-- Lazy.nvim paths
-- global.lazy_path = global.data_dir .. "/lazy/lazy.nvim"
-- global.lazy_installed = vim.loop.fs_stat(global.lazy_path) ~= nil
--
-- Diagnostics toggle (example utility)
-- global.diagnostics_enabled = true
-- global.toggle_diagnostics = function()
--   global.diagnostics_enabled = not global.diagnostics_enabled
--   if global.diagnostics_enabled then
--     vim.diagnostic.enable()
--     vim.notify("Diagnostics Enabled", vim.log.levels.INFO)
--   else
--     vim.diagnostic.enable(false)
--     vim.notify("Diagnostics Disabled", vim.log.levels.WARN)
--   end
-- end

-- Additional configurations
-- vim.opt.undodir = global.undo_dir
-- vim.opt.undofile = true

return M
