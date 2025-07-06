local M = {}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Shared `on_attach` function for keybindings
-- local on_attach = function(client, bufnr)
-- local opts = { noremap = true, silent = true, buffer = bufnr }
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Disable formatting for specific servers
-- if client.name == "ts_ls" or client.name == "eslint" then
--     client.server_capabilities.documentFormattingProvider = false
-- end
-- end

-- Helper function for default setup
function M.setup_with_default(server_name, opts)
	lspconfig[server_name].setup(vim.tbl_extend("force", {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			if client.name == "ts_ls" or client.name == "eslint" then
				client.server_capabilities.documentFormattingProvider = false
			end
			-- Add additional keybindings here
		end,
	}, opts or {}))
end

-- Debug helper
local function debug_setup(server_name)
	vim.notify("Setting up LSP for: " .. server_name, vim.log.levels.INFO)
end

-- Server configurations
M.ts_ls = function()
	debug_setup("ts_ls")
	M.setup_with_default("ts_ls", {
		root_dir = lspconfig.util.root_pattern("package.json", ".git"),
		settings = {
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayFunctionParameterTypeHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayFunctionParameterTypeHints = true,
				},
			},
		},
	})
end

M.eslint = function()
	debug_setup("eslint")
	M.setup_with_default("eslint", {
		settings = {
			format = { enable = true },
		},
	})
end

M.lua_ls = function()
	debug_setup("lua_ls")
	M.setup_with_default("lua_ls", {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	})
end

M.pyright = function()
	debug_setup("pyright")
	M.setup_with_default("pyright", {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "strict",
					autoSearchPaths = true,
				},
			},
		},
	})
end

M.clangd = function()
	debug_setup("clangd")
	M.setup_with_default("clangd", {
		cmd = { "clangd", "--background-index", "--clang-tidy", "--suggest-missing-includes" },
	})
end

M.json_ls = function()
	debug_setup("json_ls")
	M.setup_with_default("jsonls", {
		root_dir = lspconfig.util.root_pattern(".git", "package.json"),
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})
end

M.css_ls = function()
	debug_setup("css_ls")
	M.setup_with_default("cssls", {
		settings = {
			css = { validate = true },
			scss = { validate = true },
			less = { validate = true },
		},
	})
end

M.tailwindcss = function()
	debug_setup("tailwindcss")
	M.setup_with_default("tailwindcss")
end

M.emmet_ls = function()
	debug_setup("emmet_ls")
	M.setup_with_default("emmet_ls", {
		filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
	})
end
-- Return all server configurations
M.get_servers_config = function()
	return {
		["ts_ls"] = M.ts_ls,
		["eslint"] = M.eslint,
		["lua_ls"] = M.lua_ls,
		["pyright"] = M.pyright,
		["clangd"] = M.clangd,
		["json_ls"] = M.json_ls,
		["css_ls"] = M.css_ls,
		["tailwindcss"] = M.tailwindcss,
		["emmet_ls"] = M.emmet_ls,
	}
end

return M
