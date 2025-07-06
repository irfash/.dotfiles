local opts = {
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	view_options = {
		show_hidden = true,
		natural_order = true,

		is_always_hidden = function(name, _)
			return name == ".." or name == ".git"
		end,
	},
	float = {
		padding = 2,
		max_width = 90,
		max_height = 0.8,
		border = "rounded",
		winblend = 20,
		winhl = "Normal:OilFloat,FloatBorder:OilFloatBorder",
	},
}
return {
	-- "stevearc/oil.nvim",
	-- event = "VeryLazy",
	-- opts = {},
	-- dependencies = {
	-- 	"nvim-tree/nvim-web-devicons",
	-- },
	-- config = function()
	-- 	require("oil").setup(opts)
	-- 	vim.api.nvim_set_hl(0, "OilFloat", { bg = "none" }) -- No background for floating window
	-- 	vim.api.nvim_set_hl(0, "OilFloatBorder", { bg = "none", fg = "#5c6370" }) -- Border with specific color
	-- end,
}
