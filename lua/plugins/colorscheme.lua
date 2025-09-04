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
			-- vim.cmd.colorscheme("gruber-darker")
			-- vim.api.nvim_set_hl(0, "Search", { fg = "#FFFFFF", bg = "#485460" })
			-- vim.api.nvim_set_hl(0, "IncSearch", { fg = "#e4e4ef", bg = "#FF8200", bold = true })
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
			-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
			-- vim.api.nvim_set_hl(0, "Search", { fg = "", bg = "#485460" })
			-- vim.api.nvim_set_hl(0, "IncSearch", { fg = "#e4e4ef", bg = "#FF8200", bold = true })
			-- vim.cmd.colorscheme("lackluster-mint")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			vim.g.zenbones_darken_comments = 45
			vim.g.zenbones_italic_strings = false
			vim.g.zenbones_italic_comments = false
			vim.cmd.colorscheme("zenbones")
		end,
	},
}
