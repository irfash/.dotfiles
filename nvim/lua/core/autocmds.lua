-- Autocommands Setup
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
local dev_group = augroup("DevConfig", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	desc = "Highlight text on yank",
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Automatically reload files when changed externally
autocmd({ "FocusGained", "BufEnter" }, {
	group = dev_group,
	desc = "Reload file if changed outside Neovim",
	command = "checktime",
})

-- Remove trailing whitespace on save
-- if not vim.g.trim_whitespace then
--   autocmd("BufWritePre", {
-- 	  group = dev_group,
-- 	  desc = "Remove trailing whitespace before saving the file",
-- 	  command = [[%s/\s\+$//e]],
--   })
-- end

-- Open terminal in insert mode
-- autocmd("TermOpen", {
-- 	group = dev_group,
-- 	desc = "Open terminal in insert mode",
-- 	command = "startinsert",
-- })

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'neo-tree',
--   callback = function()
--     local opts = { buffer = true, desc = 'Neo-tree specific action' }
--     vim.keymap.set('n', 'b', ':Neotree buffers<CR>', opts) -- Open buffers in Neo-tree
--     vim.keymap.set('n', 'g', ':Neotree git_status<CR>', opts) -- Open Git in Neo-tree
--   end,
-- })
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'neo-tree',
--   callback = function()
--     local opts = { buffer = true, desc = 'Neo-tree specific action' }
--     -- Open buffers in Neo-tree
--     vim.keymap.set('n', 'b', ':Neotree buffers<CR>', opts)
--     -- Open Git status in Neo-tree
--     vim.keymap.set('n', 'g', ':Neotree git_status<CR>', opts)
--     -- Toggle file system in Neo-tree
--     vim.keymap.set('n', 'f', ':Neotree filesystem<CR>', opts)
--     -- Toggle between sources
--        vim.keymap.set('n', '<C-u>', ':Neotree focus<CR>', opts)
--   end,
-- })

-----------------*************---------------------
-- Auto-format on file save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",                                                          -- Apply to all file types
--   callback = function()
--     require("conform").format({ async = false, lsp_fallback = true })     -- Format the file before saving
--   end,
-- })

-- Create a custom command to format the file
vim.api.nvim_create_user_command("FormatFile", function()
	require("conform").format({ async = true, lsp_fallback = true }) -- Format the file
end, { desc = "Format the current file" })

-- end, { desc = "Toggle Transparency" })
--

vim.api.nvim_create_user_command("ToggleFormat", function()
	vim.g.autoformat = not vim.g.autoformat
	vim.notify(string.format("%s formatting...", vim.g.autoformat and "Enabling" or "Disabling"), vim.log.levels.INFO)
end, { desc = "Toggle conform.nvim auto-formatting", nargs = 0 })

vim.cmd("highlight MoreMsg guifg=#FFD700 gui=italic")
