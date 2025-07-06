require("irfash.core.options")
require("irfash.core.autocmds")
require("irfash.core.keymaps").general()

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" }) -- Transparent background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" }) -- Transparent floating windows

-- _G.is_transparent = false -- Initial transparency state (false = no transparency)
--
-- function _G.toggle_transparency()
--  _G.is_transparent = not _G.is_transparent
--   print(_G.is_transparent and "Transparency Enabled" or "Transparency Disabled")
--
--   -- Reapply the colorscheme with the updated transparency
--   require("onedarkpro").setup({
--     options = {
--       transparency = _G.is_transparent,
--     },
--   })
--   vim.cmd([[colorscheme onedark]]) -- Or "onelight" if using light modeend
-- end
-- vim.diagnostic.config({
--     virtual_text = false
-- })
vim.g.is_transparent = vim.g.is_transparent or false -- Initial transparency state
--
-- function ToggleTransparency()
--   vim.g.is_transparent = not vim.g.is_transparent
--   print(vim.g.is_transparent and "Transparency Enabled" or "Transparency Disabled")
--
--   -- Reapply the colorscheme with the updated transparency
--   require("onedarkpro").setup({
--     options = {
--       transparency = vim.g.is_transparent,
--     },
--   })
--   vim.cmd([[colorscheme onedark]]) -- Or "onelight" if using light mode
-- end
--
-- -- Map the toggle function to a keybinding (optional)
-- vim.api.nvim_set_keymap("n", "<leader>tt", ":lua ToggleTransparency()<CR>", { noremap = true, silent = true })
