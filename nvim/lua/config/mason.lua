local M = {}

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")
local configs = require("config.lsp").configs
local is_in_project_dir = require("utils").is_in_project_dir
-- blink capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities()
local opt = {
	mason = {
		ui = {
			border = "rounded", -- Single border with rounded corners
			icons = {
				package_installed = "✓", -- Icon for installed packages
				package_pending = "➜", -- Icon for pending installations
				package_uninstalled = "✗", -- Icon for uninstalled packages
			},
		},
	},

	mason_lspconfig = {

		automatic_installation = true,

		automatic_enable = {
      exclude = {
        "rust_analyzer",
      },
			"ts_ls",
			"eslint",
			"pyright",
			"cssls",
			"html",
			"jsonls",
			"tailwindcss",
			"lua_ls",
		},

		handlers = {

			function(server_name)
				-- print(server_name)
				print(vim.g[server_name])
				if vim.g[server_name] == false then
					print(vim.g[server_name])
					return
				end

				local config = configs[server_name] or {}
				config.capabilities = capabilities
				require("lspconfig")[server_name].setup(config)
			end,
		},
	},
	mason_tool_installer = {
		ensure_installed = {
			"stylua",
			"black",
		},
		auto_update = true,
		run_on_start = true,
		integrations = {
			["mason-lspconfig"] = true,
		},
	},
}

function M.setup()
	if vim.g.eslint == false then
   table.insert(opt.mason_lspconfig.automatic_enable.exclude,"eslint")
  end
	mason.setup(opt.mason)
	mason_lspconfig.setup(opt.mason_lspconfig)
	mason_tool_installer.setup(opt.mason_tool_installer)
end

return M
-- local capabilities = vim.tbl_deep_extend(
-- 	"force",
-- 	{},
-- 	vim.lsp.protocol.make_client_capabilities(),
-- 	require("cmp_nvim_lsp").default_capabilities()
-- )
