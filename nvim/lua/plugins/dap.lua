-- Create a new file: lua/plugins/dap.lua
return {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("config.dap")
		end,
	},
}
