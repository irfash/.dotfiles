-- local is_in_project_dir = require("utils").is_in_project_dir()

require("core.options").initial()
require("core.globals").setup_init()
-- if is_in_project_dir then
-- 	require("core.globals").setup_uni()
-- end

require("core.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath) -- Use prepend for better compatibility
-- vim.cmd("packadd! matchparen")
vim.o.showmatch = true -- Show matching brackets
vim.o.matchtime = 2 -- Highlight duration in tenths of a second
-- vim.opt_globala
vim.g.netrw_banner = 0 -- " Disable the help banner
-- vim.g.netrw_liststyle = 3 -- " Use tree-style listing
-- vim.g.netrw_winsize = 25 --     " Set the size of the window
-- vim.g.netrw_browse_split = 4
-- let g:netrw_browse_split = 4 " Open files in previous window
-- let g:netrw_winsize = 25     " Set the size of the window
--
-- vim.cmd([[
-- highlight Delimiter guifg=#FFA500
-- highlight Keyword guifg=#00FF00
-- ]])
require("lazyinit")
require("core.keymaps").general()
require("core.keymaps").plug_inti()
