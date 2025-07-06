return {
	"neovim/nvim-lspconfig",
	-- event = "VeryLazy",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			cmd = "Mason",
			dependencies = {
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
		},
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		{ "stevearc/conform.nvim", event = { "BufWritePre", "BufRead" } },
		"b0o/SchemaStore.nvim",
		"j-hui/fidget.nvim",
		-- "ray-x/lsp_signature.nvim",
	},
	config = function()
		if vim.g.obsidian then
			return
		end

		require("config.mason").setup()
		require("config.lsp_utils").setup_lsputils()
		require("core.keymaps").lsp()
		require("core.keymaps").telescope.lsp()
	end,
}
