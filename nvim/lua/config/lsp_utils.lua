local fidget = require("fidget")
-- local lspsaga = require("lspsaga")
-- local lsp_signature = require("lsp_signature")
-- local lazydev = require("lazydev")
local conform = require("conform")

local M = {}

local opt = {
	--conform
	conform = {
		formatters_by_ft = {
			python = { "ruff_format", "black" },
			c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
			javascript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			json = { "prettier", stop_on_first = true, name = "dprint", timeout_ms = 500, lsp_format = "prefer" },
			jsonc = { "prettier", stop_on_first = true, name = "dprint", timeout_ms = 500, lsp_format = "prefer" },
			less = { "prettier" },
			lua = { "stylua" },
			rust = { name = "rust_analyzer", timeout_ms = 500, lsp_format = "prefer" },
			scss = { "prettier" },
			sh = { "shfmt" },
			typescript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
			-- For filetypes without a formatter:
			-- ["_"] = { "trim_whitespace", "trim_newlines" },
		},
		format_on_save = function()
			if vim.g.format_on_save == nil or vim.g.format_on_save then
				print("format_on_save")
				return {}
			end
			return false
		end,
	},
	-- lazydev = {
	--   autostart = true, -- Automatically start LazyDev when Lua LSP is attached
	--   default_config = {
	--     library = { plugins = { "nvim-dap-ui", "nvim-test" }, types = true },
	-- runtime = { version = "LuaJIT" },
	--   }
	-- },
	-- lsp_signature = {
	-- 	bind = true,
	-- 	hint_enable = true,
	-- },
	fidget = {
		notification = {
			window = {
				winblend = 0, -- Background color opacity in the notification window
				-- border = "rounded", -- Rounded window border
				-- border = "none", -- Border around the notification window
			},
			-- integration = {
			--   ["nvim-tree"] = { enable = true }, -- Enable integration with `nvim-tree.lua`
			--   ["mason"] = { enable = true },   -- Enable progress updates for Mason
			-- },
		},
	},
}

function M.setup_lsputils()
	conform.setup(opt.conform)
	fidget.setup(opt.fidget)
	-- lsp_signature.setup(opt.lsp_signature)
	-- lazydev.setup(opt.lazydev)
	-- lspsaga.setup({})
	-- require("nvim-navic").setup {
	--     highlight = true, -- Enable highlighting for the context
	--     separator = " > ", -- Separator between context items
	--     depth_limit = 3, -- Limit the depth of displayed context
	--   }
	-- vim.diagnostic.config({
	--   float = {
	--     focusable = false,
	--     style = "minimal",
	--     border = "rounded",
	--     -- source = "always",
	--     header = "",
	--     prefix = "",
	--   },
	-- })
end

return M
