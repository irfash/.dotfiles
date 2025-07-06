-- Pretty bufferline.
return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				custom_filter = function(buf_number)
					return vim.fn.isdirectory(vim.fn.bufname(buf_number)) == 0
				end,
				show_close_icon = false,
				show_buffer_close_icons = false,
				truncate_names = false,
				separator_style = "none",
				indicator = { style = "none", icon = "" },
				close_command = function(bufnr)
					require("mini.bufremove").delete(bufnr, false)
				end,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local icons = require("icons").diagnostics
					local indicator = (diag.error and icons.ERROR .. " " or "") .. (diag.warning and icons.WARN or "")
					return vim.trim(indicator)
				end,
			},
		},
		keys = {
			-- Buffer navigation.
			{ "<s-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick a buffer to open" },
			{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
		},
	},
}
