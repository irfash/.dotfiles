-- Get active LSP clients and save their details to a file
-- local clients = vim.lsp.get_active_clients()
-- local file_path = vim.fn.expand("~/.local/share/nvim/active_lsp_clients.log")
--
-- -- Convert clients table to a string for saving
-- local content = vim.inspect(clients)
--
-- -- Write the content to the file
-- local file = io.open(file_path, "w")
-- if file then
--   file:write(content)
--   file:close()
--   print("Active LSP clients saved to " .. file_path)
-- else
--   print("Failed to save active LSP clients")
-- end
