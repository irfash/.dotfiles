local map = require("utils").map
local M = {}

M.general = function()
	--insert movement
	map("i", "<C-h>", "<Left>")
	map("i", "<C-j>", "<Down>")
	map("i", "<C-k>", "<Up>")
	map("i", "<C-l>", "<Right>")

	-- Copy and paste in the same cursor position
	map("n", "p", function()
		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.cmd("put")
		vim.api.nvim_win_set_cursor(0, { row + 1, col })
	end, " Copy and paste in the same cursor position")

	map("i", "jj", "<Esc>", "Exit insert mode quickly") -- Exit insert mode
	map("i", "<C-c>", "<Esc>", "Escape insert mode") -- Escape using Ctrl-C

	-- Save only on new changes
	map("n", "<C-s>", "<cmd>update<CR>")

	map("n", "<leader>w", ":write<CR>", "Save current file")
	-- Window navigation
	map("n", "<C-h>", "<C-w>h", "Move to the left window")
	map("n", "<C-l>", "<C-w>l", "Move to the right window")
	map("n", "<C-j>", "<C-w>j", "Move to the window below")
	map("n", "<C-k>", "<C-w>k", "Move to the window above")
	-- *** Text editing
	-- Resize splits
	map("n", "<A-k>", ":resize +2<CR>")
	map("n", "<A-j>", ":resize -2<CR>")
	map("n", "<A-h>", ":vertical resize +2<CR>")
	map("n", "<A-l>", ":vertical resize -2<CR>")
	-- Indent blocks in visual mode
	map("v", "<", "<gv", "Unindent selected block")
	map("v", ">", ">gv", "Indent selected block")

	-- -- Split window shortcuts
	map("n", "<leader>sh", ":split<CR>", "Split window horizontally")
	map("n", "<leader>sv", ":vsplit<CR>", "Split window vertically")

	-- Move selected lines in visual mode

	map("v", "J", ":m '>+1<CR>gv=gv", "Move selected lines down")
	map("v", "K", ":m '<-2<CR>gv=gv", "Move selected lines up")

	-- Better joining
	map("n", "J", "mzJ`z", "Join lines and retain cursor position")

	-- Center screen after scrolling
	map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
	map("n", "<C-u>", "<C-u>zz", "Scroll up and center")

	map("v", "??", 'y:h <C-R>"<cr>"') -- Show vim help
	map("v", "?/", 'y:/ <C-R>"<cr>"') -- Search across the buffer

	-- Quality of Life
	map("n", "<leader>q", ":quit<CR>", "Quit current window")
	map("n", "<leader>rl", ":set relativenumber!<CR>", "Toggle Relative Numbers")
end

M.plug_inti = function()
	--oil
	vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
end

M.mini = function()
	local minipick = require("mini.pick")
	local miniextra = require("mini.extra")
	local minivisits = require("mini.visits")
	local builtin = minipick.builtin

	map({ "n" }, "<leader>ff", function()
		builtin.files()
	end, "find files")
	map({ "n" }, "<leader>bs", function()
		builtin.buffers()
	end, "Find buffers")

	map({ "n" }, "<leader>fr", function()
		builtin.resume()
	end, "Resume finding")

	map({ "n" }, "<leader>fw", function()
		builtin.grep_live()
	end, "Grep live")

	vim.b[0].miniindentscope_disable = true

	map({ "n" }, "<leader>tb", function()
		vim.b[0].miniindentscope_disable = not vim.b[0].miniindentscope_disable -- Toggle blankline animations
	end, "Toggle blankline animations")

	map({ "n" }, "<leader>e", function()
		local _ = require("mini.files").close() or require("mini.files").open()
	end, "Toggle minifiles")

	map({ "n" }, "<leader>bq", function()
		require("mini.bufremove").delete()
	end, "Remove current buffer")

	map("n", "<A-s>", function()
		miniextra.pickers.visit_paths({ filter = "todo" })
	end, "Add file to todolist")

	map("n", "<A-a>", function()
		minivisits.add_label("todo")
	end, "Remove file from todolist")

	map("n", "<A-A>", function()
		minivisits.remove_label()
	end, "Remove label from file")

	map("n", "<leader>gc", function()
		miniextra.pickers.git_commits()
	end, "Show git commits")

	map("n", "<leader>gh", function()
		miniextra.pickers.git_hunks()
	end, "Show git hunks")

	map("n", "<leader>dp", function()
		miniextra.pickers.diagnostic()
	end, "Diagnostic in picker")
end

M.lsp = function()

	-- map("n", "K", vim.lsp.buf.hover, "Hover documentation")
	-- map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	-- map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
	-- map("n", "gr", vim.lsp.buf.references, "List references")
	-- map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	-- map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
	-- -- map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics")
	-- map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	-- map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

	-- map("n", "<leader>f", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, "Format code")
end

M.telescope = {
	lsp = function()
		local builtin = require("telescope.builtin")

		local function list_component_props()
			local current_word = vim.fn.expand("<cword>") -- Get the word under the cursor
			if not current_word or current_word == "" then
				print("No component under cursor!")
				return
			end

			-- Use LSP to get the definition of the current word
			vim.lsp.buf_request(
				0,
				"textDocument/definition",
				vim.lsp.util.make_position_params(),
				function(_, result, ctx)
					if not result or vim.tbl_isempty(result) then
						print("No definition found for: " .. current_word)
						return
					end

					-- Handle multiple definitions and ensure valid URIs
					local definition = result[1]
					local uri = definition.uri or definition.targetUri
					if not uri then
						print("Invalid LSP response: Missing URI.")
						return
					end

					local range = definition.targetRange or definition.range
					local file_path = vim.uri_to_fname(uri)

					-- Read the file and extract props
					local lines = vim.fn.readfile(file_path)
					if not lines or vim.tbl_isempty(lines) then
						print("Failed to read definition file.")
						return
					end

					local props_found = {}
					local is_inside_props = false

					for _, line in ipairs(lines) do
						-- Detect start of props definition
						if
							line:match(current_word .. "Props") or line:match("interface%s+" .. current_word .. "Props")
						then
							is_inside_props = true
						end

						-- Collect props if inside the props block
						if is_inside_props then
							table.insert(props_found, line)
							if line:match("}") then
								break
							end
						end
					end

					if vim.tbl_isempty(props_found) then
						print("No props found for: " .. current_word)
						return
					end

					-- Use Telescope to display props
					require("telescope.pickers")
						.new({}, {
							prompt_title = current_word .. " Props",
							finder = require("telescope.finders").new_table({
								results = props_found,
							}),
							sorter = require("telescope.config").values.generic_sorter({}),
						})
						:find()
				end
			)
		end

		vim.keymap.set("n", "gp", function()
			local file = vim.fn.expand("%:p") -- Get current file path
			local cmd = "npx react-docgen " .. file

			vim.fn.jobstart(cmd, {
				stdout_buffered = true,
				on_stdout = function(_, data)
					if data then
						-- Format JSON output for readability
						local json = table.concat(data, "\n")
						local props = vim.fn.json_decode(json)

						-- Extract prop names and descriptions
						local output = {}
						for prop, details in pairs(props.props or {}) do
							table.insert(
								output,
								string.format(
									"**%s** (%s) - %s",
									prop,
									details.type.name,
									details.description or "No description"
								)
							)
						end

						-- Show props in a floating window
						if #output > 0 then
							vim.lsp.util.open_floating_preview(output, "markdown", {})
						else
							vim.notify("No props found", vim.log.levels.INFO)
						end
					end
				end,
				on_stderr = function(_, err)
					if err then
						vim.notify("Error: " .. table.concat(err, "\n"), vim.log.levels.ERROR)
					end
				end,
			})
		end, { desc = "Show Component Props" })
		-- Map the function to a keybinding
		-- vim.keymap.set("n", "gp", list_component_props, { desc = "List all props of the hovered component" })

		-- Map the function to a keybinding
		-- vim.keymap.set("n", "gp", list_component_props, { desc = "List all props of the hovered component" })

		--goto
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definitions" })
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "List references" })
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Find implementations" })
		vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Go to type definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
		--diagnostic
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Send diagnostics to quickfix list" })
		--code action
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
		vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions for selection" })
		-- vim.keymap.set("v", "<leader>ca", vim.lsp.buf.range_code_action, { desc = "Show code actions for selection" })
		--hover
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
		vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, { desc = "Show signature help" })
		--rename symbol
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		--symbols
		vim.keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
		vim.keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
		--formatting
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format code" })

		-- vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Telescope: Go to definitions" })
		-- vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Telescope: Go to implementations" })
		-- vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Telescope: List references" })
		-- vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Telescope: Document symbols" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>ws",
		-- 	builtin.lsp_dynamic_workspace_symbols,
		-- 	{ desc = "Telescope: Workspace symbols" }
		-- )
	end,
	files = function()
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep (Search in Project)" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find Help" })
		vim.keymap.set(
			"n",
			"<leader>fl",
			"<cmd>Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "Search Current File" }
		)
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<CR>", { desc = "Find Registers" })
	end,
	notes = function()
		vim.keymap.set("n", "<leader>fn", function()
			require("telescope.builtin").find_files({
				prompt_title = "Find Notes",
				cwd = vim.fn.expand("~/Notes"),
			})
		end, { desc = "Find Notes in ~/Notes" })
	end,
}
M.todo = function() end
-- M.t_lsp = function ()
-- 	local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope: Go to definitions' })
-- vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, { desc = 'Telescope: Go to implementations' })
-- vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope: List references' })
-- vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Telescope: Document symbols' })
-- vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope: Workspace symbols' })
-- end
--
return M
-- Center screen after search navigation
-- map("n", "n", "nzzzv", "Next search result and center")
-- map("n", "N", "Nzzzv", "Previous search result and center")
--
-- -- Delete without yanking
-- map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")
--
-- -- Paste without overwriting register
-- map("v", "<leader>p", '"_dP', "Paste without overwriting register")
--
-- -- Quick save
-- map("n", "<leader>w", ":write<CR>", "Save current file")
--
-- -- Quick quit
-- map("n", "<leader>q", ":quit<CR>", "Quit current window")
--
-- -- Split window shortcuts
-- map("n", "<leader>sh", ":split<CR>", "Split window horizontally")
-- map("n", "<leader>sv", ":vsplit<CR>", "Split window vertically")
--
-- -- Navigate command history
-- map("c", "<C-j>", "<C-n>", "Next command in history")
-- map("c", "<C-k>", "<C-p>", "Previous command in history")
--
-- -- Open location list
-- map("n", "<leader>ll", ":lopen<CR>", "Open location list")
-- map("n", "<leader>lc", ":lclose<CR>", "Close location list")
--
-- -- Open quickfix list
-- -- map("n", "<leader>qq", ":copen<CR>", "Open quickfix list")
-- -- map("n", "<leader>qc", ":cclose<CR>", "Close quickfix list")
--
-- -- Indent blocks in visual mode
-- map("v", "<", "<gv", "Unindent selected block")
-- map("v", ">", ">gv", "Indent selected block")
--
-- -- Redraw screen (useful for UI glitches)
-- map("n", "<leader>r", ":redraw!<CR>", "Redraw screen")
--
-- -- Toggle highlight search
-- map("n", "<leader>hl", ":set hlsearch!<CR>", "Toggle search highlight")
