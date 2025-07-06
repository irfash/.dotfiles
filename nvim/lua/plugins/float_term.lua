return {
	"voldikss/vim-floaterm",
	event = "VeryLazy",
	config = function()
		-- Floaterm global settings

		local function open_float_term()
			vim.g.floaterm_width = 0.85 -- Set width to 85% of the screen
			vim.g.floaterm_height = 0.75 -- Set height to 75% of the screen
			vim.g.floaterm_wintype = "float" -- Use floating window for the terminal
			vim.g.floaterm_position = "center" -- Center the floating window
			vim.g.floaterm_autoclose = 1 -- Close terminal automatically when the process ends
			vim.g.floaterm_borderchars = "─│─│╭╮╯╰" -- Clean border style
			vim.cmd("FloatermNew")
		end

		local function open_bottom_term()
			vim.g.floaterm_width = 1 -- Full width
			vim.g.floaterm_height = 0.3 -- 30% height at the bottom
			vim.g.floaterm_wintype = "split" -- Use horizontal split
			vim.g.floaterm_position = "bottom" -- Position at the bottom
			vim.cmd("FloatermNew")
		end
		-- Fix Floaterm border and background colors
		vim.cmd([[
			highlight FloatermBorder guifg=#5C6370 guibg=none
		]])
		-- Popular keymaps
		vim.keymap.set("n", "<leader>tf", function()
			open_float_term()
		end, { desc = "Open Floaterm", noremap = true, silent = true })
		-- Toggle Floaterm with Ctrl + `
		vim.keymap.set(
			"n",
			"<C-\\>",
			"<cmd>FloatermToggle<CR>",
			{ desc = "Toggle Floaterm", noremap = true, silent = true }
		)
		vim.keymap.set(
			"t",
			"<C-\\>",
			"<cmd>FloatermToggle<CR>",
			{ desc = "Toggle Floaterm in terminal mode", noremap = true, silent = true }
		)
		-- Open Bottom Terminal (Ctrl + b)
		vim.keymap.set("n", "<C-b>", function()
			open_bottom_term()
		end, { desc = "Open Floaterm at the bottom", noremap = true, silent = true })

		-- Open a new Floaterm
		vim.keymap.set(
			"t",
			"<C-n>",
			"<cmd>FloatermNew<CR>",
			{ desc = "Open a new Floaterm", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>ft", function()
			open_float_term()
		end, { desc = "Open a new Floating Terminal", noremap = true, silent = true })
		-- Navigate between terminals
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>fn",
		-- 	"<cmd>FloatermNext<CR>",
		-- 	{ desc = "Go to the next Floaterm", noremap = true, silent = true }
		-- )
		vim.keymap.set(
			"t",
			"<C-l>",
			"<cmd>FloatermNext<CR>",
			{ desc = "Go to the next Floaterm", noremap = true, silent = true }
		)
		vim.keymap.set(
			"t",
			"<C-c>",
			"<cmd>FloatermKill<CR>",
			{ desc = "Close the current Floaterm", noremap = true, silent = true }
		)

		vim.keymap.set(
			"t",
			"<C-h>",
			"<cmd>FloatermPrev<CR>",
			{ desc = "Go to the previous Floaterm", noremap = true, silent = true }
		)

		-- Escape terminal mode with Esc
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode", noremap = true, silent = true })
	end,
}
