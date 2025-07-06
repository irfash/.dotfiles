return {
    "ahmedkhalf/project.nvim",
		event = "VimEnter",
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern", "lsp" },
            patterns = { ".git", ".nvim.lua", "Makefile", "package.json" },  -- Adjust these patterns based on your project type
        })
    end,
}
