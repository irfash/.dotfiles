return {
	{ "sindrets/diffview.nvim", event = "VeryLazy" },

	{
		"NeogitOrg/neogit",
		event = "VeryLazy",

		lazy = true,
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", ":Neogit<cr>", desc = "neo[g]it" },
		},
		config = function()
			require("neogit").setup({
				disable_commit_confirmation = true,
				integrations = {
					diffview = true,
				},
			})
		end,
	},
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("gitsigns").setup({})
	-- 	end,
	-- },
}
