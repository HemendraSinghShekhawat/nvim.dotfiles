return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-media-files.nvim" },
	},
	config = function()
		local actions = require("telescope.actions")
		-- The easiest way to use telescope, is to start by doing something like:
		--  :Telescope help_tags
		-- Two important keymaps to use while in telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<c-enter>"] = "to_fuzzy_refine",
						["<c-y>"] = actions.select_default,
						-- ['c-q'] = actions.smart_send_to_gflist + actions.open_qflist
					},
					n = {
						["<c-y>"] = actions.select_default,
					},
				},
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						},
						n = {
							["d"] = actions.delete_buffer,
						},
					},
				},
				find_files = require("custom.utils").select_find_command(vim.fn.executable),
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable telescope extensions, if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					vertical = {
						width = 0.99,
					},
					horizontal = {
						width = 0.99,
					},
				},
				path_display = {
					"truncate",
				},
			},
		})

		-- [F]ind
		vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "[F]ind in working [d]irectory" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it files" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, { desc = "[F]uzzy [F]ind" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind/[S]earch by grep" })
		vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
		vim.keymap.set("n", "<leader>fB", builtin.builtin, { desc = "[F]ind [B]uiltin Telescope" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })

		-- [O]pen
		vim.keymap.set(
			"n",
			"<leader>op",
			builtin.oldfiles,
			{ desc = 'Telescope [O]pen [P]revious Files ("." for repeat)' }
		)
		vim.keymap.set("n", "<leader>ob", builtin.buffers, { desc = "Telescope [O]pen [b]uffers" })
		-- Shortcut for searching your neovim configuration files
		vim.keymap.set("n", "<leader>on", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
