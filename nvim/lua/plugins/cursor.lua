return {
	"xiyaowong/nvim-transparent",
	opts = {},
	keys = {
		{ "<leader>uP", "<Cmd>TransparentToggle<CR>", desc = "Toggle Transparent" },
	},
}

-- return {
-- 	"sphamba/smear-cursor.nvim",
-- 	event = "VeryLazy",
-- 	cond = vim.g.neovide == nil,
-- 	opts = {
-- 		hide_target_hack = true,
-- 		cursor_color = "none",
-- 	},
-- 	specs = {
-- 		-- disable mini.animate cursor
-- 		-- {
-- 		--   "echasnovski/mini.animate",
-- 		--   optional = true,
-- 		--   opts = {
-- 		--     cursor = { enable = false },
-- 		--   },
-- 		-- },
-- 	},
-- }
