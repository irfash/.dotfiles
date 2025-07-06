local schemastore = require("schemastore")

local M = {}

M.configs = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
			},
		},
	},
	ts_ls = {
		settings = {
			javascript = {
				inlayHints = { includeInlayParameterNameHints = "all" },
			},
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					parameterNames = { enabled = "literals" },
					functionLikeReturnTypes = { enabled = true },
				},
				suggest = { completeFunctionCalls = true },
				updateImportsOnFileMove = { enabled = "always" },
			},
		},
	},
	pyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "strict",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	jsonls = {
		settings = {
			json = {
				schemas = schemastore.json.schemas(),
				validate = { enable = true },
			},
		},
	},
	yamlls = {
		settings = {
			yaml = {
				schemaStore = { enable = false },
				schemas = schemastore.yaml.schemas(),
			},
		},
	},
}

return M
