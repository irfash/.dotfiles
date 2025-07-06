return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		-- Date: 2025-01-23
		-- Define highlights explicitly to handle deprecations (as of the latest gitsigns.nvim update)
		local highlights = {
			{ name = "GitSignsAdd", fg = "#00ff00" }, -- Add sign (green color for additions)
			{ name = "GitSignsAddLn", link = "GitSignsAdd" }, -- Add line highlight
			{ name = "GitSignsAddNr", link = "GitSignsAdd" }, -- Add number highlight

			{ name = "GitSignsChange", fg = "#ffff00" }, -- Change sign (yellow color for changes)
			{ name = "GitSignsChangeLn", link = "GitSignsChange" }, -- Change line highlight
			{ name = "GitSignsChangeNr", link = "GitSignsChange" }, -- Change number highlight

			{ name = "GitSignsDelete", fg = "#ff0000" }, -- Delete sign (red color for deletions)
			{ name = "GitSignsDeleteLn", link = "GitSignsDelete" }, -- Delete line highlight
			{ name = "GitSignsDeleteNr", link = "GitSignsDelete" }, -- Delete number highlight

			{ name = "GitSignsChangedelete", fg = "#ff8800" }, -- Change-delete sign (orange for modified deletions)
			{ name = "GitSignsChangedeleteLn", link = "GitSignsChangedelete" }, -- Change-delete line highlight
			{ name = "GitSignsChangedeleteNr", link = "GitSignsChangedelete" }, -- Change-delete number highlight
		}

		-- Apply all highlights
		for _, hl in ipairs(highlights) do
			if hl.link then
				vim.api.nvim_set_hl(0, hl.name, { link = hl.link })
			else
				vim.api.nvim_set_hl(0, hl.name, { fg = hl.fg })
			end
		end

		-- Date: 2025-01-23
		-- Configure gitsigns.nvim with latest recommendations and features
		require("gitsigns").setup({
			signs = {
				add = { text = "│" }, -- Add sign (vertical bar)
				change = { text = "│" }, -- Change sign (vertical bar)
				delete = { text = "_" }, -- Delete sign (underscore)
				topdelete = { text = "‾" }, -- Top delete sign (overline)
				changedelete = { text = "~" }, -- Change-delete sign (tilde)
			},
			current_line_blame = true, -- Enable inline blame for the current line
			current_line_blame_opts = {
				virt_text = true, -- Show blame text
				virt_text_pos = "eol", -- Position blame text at the end of the line
				delay = 100, -- Delay before showing blame (milliseconds)
				ignore_whitespace = false, -- Do not ignore whitespace-only changes
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			update_debounce = 100, -- Debounce updates for better performance
			max_file_length = 50000, -- Disable gitsigns for large files
			preview_config = {
				border = "rounded", -- Rounded border for hunk preview
				style = "minimal", -- Minimal style
				relative = "cursor", -- Position relative to the cursor
				row = 0, -- Row offset
				col = 1, -- Column offset
			},
			-- Date: 2025-01-23
			-- Attach key mappings for gitsigns functionality
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Key mappings
				local function map(mode, lhs, rhs, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Hunk navigation
				map("n", "]h", gs.next_hunk, { desc = "Next Hunk" }) -- Navigate to the next hunk
				map("n", "[h", gs.prev_hunk, { desc = "Previous Hunk" }) -- Navigate to the previous hunk

				-- Hunk actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" }) -- Stage the current hunk
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" }) -- Reset the current hunk
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Hunk (Visual)" }) -- Stage hunk in visual mode
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk (Visual)" }) -- Reset hunk in visual mode
				map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" }) -- Stage the entire buffer
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" }) -- Undo staging for the last hunk
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" }) -- Reset the entire buffer
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" }) -- Preview the current hunk
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame Line" }) -- Show blame for the current line
				map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" }) -- Show diff for the current buffer
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "Diff This (Base)" }) -- Show diff against the base commit

				-- Text object for hunks
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" }) -- Select a hunk
			end,
		})
	end,
}
