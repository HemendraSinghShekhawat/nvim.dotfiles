return {
	{
		"phha/zenburn.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- vim.cmd.colorscheme 'zenburn'
		end,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		name = "gruber-darker",
		priority = 1000,
		config = function()
			require("gruber-darker").setup({
				bold = true,
				invert = {
					signs = true,
					tabline = true,
					visual = false,
				},
				italic = {
					strings = false,
					comments = false,
					operators = false,
					folds = false,
				},
				undercurl = true,
				underline = true,
			})
			vim.cmd.colorscheme("gruber-darker")
			vim.api.nvim_set_hl(0, "Search", { fg = "#000000", bg = "#7acda3" })
			vim.api.nvim_set_hl(0, "IncSearch", { fg = "#FFFFFF", bg = "#485460", bold = true })
		end,
	},
}
