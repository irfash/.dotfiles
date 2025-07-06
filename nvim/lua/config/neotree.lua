local M = {}
local function is_neo_tree_open(filetype)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == 'neo-tree' then
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_name:find(filetype) then
        return true
      end
    end
  end
  return false
end

function M.toggle_neo_tree(command)
  local filetype = ''
  if command == "reveal" then
    filetype = "filesystem"
  else
    filetype = command
  end
  if is_neo_tree_open(filetype) then
    vim.cmd("Neotree close")
  else
    vim.cmd("Neotree " .. command)
  end
end

return M
