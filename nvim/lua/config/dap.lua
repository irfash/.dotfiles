-- Create a new file: lua/config/dap.lua
local dap = require("dap")
local dapui = require("dapui")

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		type = "node2",
		name = "Launch",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
dap.configurations.typescript = dap.configurations.javascript

dapui.setup()

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle DAP UI" })

require("telescope").load_extension("dap")
