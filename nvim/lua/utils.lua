local project_file_dir = "/Users/m.khan.farook.ali/Documents/Projects/Uni/react-native"

local M = {}

function M.map(mode, keys, action, desc)
	desc = desc or ""
	local opts = { noremap = true, silent = true, desc = desc }
	vim.keymap.set(mode, keys, action, opts)
end

function M.is_in_project_dir()
	return vim.fn.getcwd():find(project_file_dir, 1, true) ~= nil
end

--neotree_utils
function M.to_trash(state)
	if vim.fn.executable("trash") == 0 then
		vim.api.nvim_echo({
			{ "Trash utility not installed.\n", "ErrorMsg" },
			{ "Install it with: brew install trash\n", nil },
		}, false, {})
		return
	end
	local inputs = require("neo-tree.ui.inputs")
	local path = state.tree:get_node().path
	inputs.confirm("Trash " .. path .. "?", function(confirmed)
		if not confirmed then
			return
		end
		vim.fn.system({ "trash", vim.fn.fnameescape(path) })
		require("neo-tree.sources.manager").refresh(state.name)
	end)
end

-- local function is_neo_tree_open()
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     if vim.bo[buf].filetype == 'neo-tree' then
--       -- local buf_name = vim.api.nvim_buf_get_name(buf)
--       -- if buf_name:find(filetype) then
--         return true
--     end
--   end
--   return false
-- end
--
-- local function in_neo_tree()
--   if vim.bo[0].filetype == 'neo-tree' then
--     print('i am in neo')
--     return true
--   else
--     print('no i am not in neo')
--     return false
--   end
--
-- end
--
--
-- function M.toggle_or_focus()
--   if in_neo_tree() then
--     print('toggle')
--     vim.cmd("Neotree toggle")
--   else
--     print('focs')
--     vim.cmd("Neotree focus")
--   end
--
-- end

return M
