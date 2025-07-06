local opts = {
	icons = {
		ui = {
			bar = {
				separator = require("icons").splitArrows.right,
				extends = "…",
			},
			menu = {
				separator = "",
				indicator = require("icons").splitArrows.right,
			},
		},
	},
}

return {
	"Bekaboo/dropbar.nvim",
	name = "dropbar",
	keys = {
		require("utils").map({ "n" }, "<leader>p", function()
			require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
		end, "Toggle dropbar menu"),
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("dropbar").setup(opts)
	end,
}
