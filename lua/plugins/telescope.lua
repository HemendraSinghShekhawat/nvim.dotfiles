local utils = require "custom.utils"

return {
	'nvim-telescope/telescope.nvim',
	event = 'VeryLazy',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-lua/popup.nvim' },
		{ 'nvim-telescope/telescope-media-files.nvim' },
	},
	config = function()
		local actions = require "telescope.actions"
		-- The easiest way to use telescope, is to start by doing something like:
		--  :Telescope help_tags
		-- Two important keymaps to use while in telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['<c-enter>'] = 'to_fuzzy_refine',
						-- ['c-q'] = actions.smart_send_to_gflist + actions.open_qflist
					},
					n = {
					}
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
						}
					}
				},
				find_files = require("custom.utils").select_find_command(vim.fn.executable),
			},
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		}

		-- Enable telescope extensions, if they are installed
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		-- See `:help telescope.builtin`
		local builtin = require 'telescope.builtin'
		require('telescope').setup {
			defaults = {
				layout_strategy = 'horizontal',
				layout_config = {
					vertical = {
						width = 0.95,
					},
					horizontal = {
						width = 0.95,
					},
				},
				path_display = {
					'truncate',
				},
			},
		}

		vim.keymap.set('n', '<leader>fd', builtin.find_files)
		vim.keymap.set('n', '<leader>ft', builtin.git_files)
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)

		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>fB', builtin.builtin, { desc = '[f]ind [B]uiltin Telescope' })
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, {
			desc = '[f]ind current [W]ord',
			-- word_match = '-w',
			-- short_path = true,
			-- only_sort_text = true,
			-- layout_strategy = 'vertical',
		})
		vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
		vim.keymap.set('n', '<leader>op', builtin.oldfiles, { desc = 'Telescope [O]pen [P]revious Files ("." for repeat)' })
		vim.keymap.set('n', '<leader>ob', builtin.buffers, { desc = 'Telescope [O]pen [b]uffers' })

		-- vim.keymap.set('<space>f/', 'grep_open_files', {
		--   layout_strategy = 'vertical',
		-- })

		-- Slightly advanced example of overriding default behavior and theme
		-- vim.keymap.set('n', '<leader>/', function()
		--   -- You can pass additional configuration to telescope to change theme, layout, etc.
		--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		--   })
		-- end, { desc = '[/] Fuzzily search in current buffer' })

		-- Also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set('n', '<leader>s/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = '[S]earch [/] in Open Files' })

		-- Shortcut for searching your neovim configuration files
		vim.keymap.set('n', '<leader>on', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[S]earch [N]eovim files' })

		-- for media files
		--   require('telescope').setup {
		--     extensions = {
		--       media_files = {
		--         -- filetypes whitelist
		--         -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		--         filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
		--         -- find command (defaults to `fd`)
		--         find_cmd = 'rg',
		--       },
		--     },
		--   }
		--   require('telescope').extensions.media_files.media_files()
		--   vim.keymap.set('n', '<leader>oi', '<cmd>Telescope media_files<cr>', { desc = '[O]pen [I]mages' })
	end,
}
