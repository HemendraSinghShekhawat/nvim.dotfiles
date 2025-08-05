return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- Optional: Disable dynamic mode coloring
			statusline.section_mode = function()
				local mode = vim.fn.mode()
				-- Simple lookup table for displaying short names of modes
				local mode_hl = "MyStatuslineMode"
				local mode_str = ({
					n = "NORMAL",
					i = "INSERT",
					v = "VISUAL",
					V = "V-LINE",
					["\22"] = "V-BLOCK", -- Ctrl-V
					c = "COMMAND",
					R = "REPLACE",
					t = "TERMINAL",
				})[mode] or mode

				return statusline.combine_groups({
					{ hl = mode_hl, strings = { mode_str } },
				})
			end

			-- Define your custom highlight group
			vim.api.nvim_set_hl(0, "MyStatuslineMode", {
				fg = "#ffffff", -- white text
				bg = "#485460", -- gray background
				bold = true,
			})

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = true })
		end,
	},
}
