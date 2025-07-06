-- Autoclosing braces.
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local conds = require("nvim-autopairs.conds")
			npairs.setup()
			npairs.add_rule(Rule("<", ">", {
				"-html",
				"-javascriptreact",
				"-typescriptreact",
			}):with_pair(conds.before_regex("%a+:?:?$", 3)):with_move(function(opts)
				return opts.char == ">"
			end))
		end,
	},
}
