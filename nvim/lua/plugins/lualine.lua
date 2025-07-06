return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load lazily for performance
    config = function()
      -- Initialize options table
      local opts = {}

      -- Load and customize the auto theme
      local auto = require("lualine.themes.auto")
      for _, mode in ipairs({ "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }) do
        if auto[mode] and auto[mode].c then
          auto[mode].c.bg = "NONE" -- Set background to transparent
        end
      end

      -- Abbreviated mode names
      local mode_map = {
        n = "N", -- Normal
        i = "I", -- Insert
        v = "V", -- Visual
        c = "C", -- Command
        R = "R", -- Replace
        t = "T", -- Terminal
      }
      local function mode_abbrev()
        local mode = vim.fn.mode():sub(1, 1) -- Get the first character of the mode
        return mode_map[mode] or mode:upper() -- Default to uppercase if not mapped
      end

      -- Core options for lualine
      opts.options = {
        theme = auto, -- Apply the customized theme
        component_separators = { left = "\\", right = "/" }, -- Separator for components
        section_separators = { left = "", right = "" }, -- Separator for sections
        disabled_filetypes = { -- Disable for specific filetypes
          statusline = { "NvimTree", "packer", "netrw" },
          winbar = {},
        },
        globalstatus = true, -- Single statusline for all windows
      }

      -- Main sections for active statusline
      opts.sections = {
        lualine_a = { mode_abbrev }, -- Abbreviated mode
        lualine_b = { "branch", "diff" }, -- Git branch and changes
        lualine_c = {}, -- Placeholder for potential future context or filename
        lualine_x = {
          {
            "diagnostics", -- LSP diagnostics
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_y = { "filetype" }, -- Display filetype
        lualine_z = { "progress", "location" }, -- Progress and cursor location
      }

      -- Sections for inactive statusline
      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" }, -- Show filename
        lualine_x = { "location" }, -- Show cursor location
        lualine_y = {},
        lualine_z = {},
      }

      -- Extensions for lualine
      opts.extensions = { "neo-tree", "aerial", "mason", "fugitive" }

      -- Apply lualine setup
      require("lualine").setup(opts)
    end,
  },
}
-- component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
