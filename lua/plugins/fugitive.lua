return {
	"tpope/vim-fugitive",
	config = function()
		local Group_Fugitive = vim.api.nvim_create_augroup("Group_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = Group_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				-- vim.keymap.set("n", "<leader>p", function()
				--     vim.cmd.Git("push")
				-- end, {buffer = bufnr, remap = false, desc = "Git Push"})
				--
				-- -- rebase always
				-- vim.keymap.set("n", "<leader>P", function()
				--     vim.cmd.Git({"pull",  "--rebase"})
				-- end, {buffer = bufnr, remap = false, desc = "Git Pull Rebase"})

				-- It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				-- vim.keymap.set("n", "<leader>t", ":Git push -u origin ", {buffer = bufnr, remap = false, desc = "Git Push Tracking"})
			end,
		})

		vim.keymap.set("n", "<leader>gj", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "<leader>gk", "<cmd>diffget //3<CR>")
	end,
	keys = {
		{
			"<leader>fug",
			function()
				vim.cmd.Git()
			end,
			desc = "Git Status",
		},
	},
}
