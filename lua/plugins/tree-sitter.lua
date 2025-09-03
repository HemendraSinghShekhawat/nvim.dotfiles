return { -- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"html",
					"lua",
					"markdown",
					"vim",
					"vimdoc",
					"javascript",
					"typescript",
				},
				-- Autoinstall languages that are not installed
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },

				refactor = {
					highlight_definitions = { enable = true },
					highlight_current_scope = { enable = false },

					-- smart_rename = {
					--   enable = false,
					--   keymaps = {
					--     -- mapping to rename reference under cursor
					--     smart_rename = 'grr',
					--   },
					-- },

					-- navigation = {
					--   enable = false,
					--   keymaps = {
					--     goto_definition = 'gnd', -- mapping to go to definition of symbol under cursor
					--     list_definitions = 'gnD', -- mapping to list all definitions in current file
					--   },
					-- },
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
						node_incremental = "<M-w>", -- increment to the upper named parent
						node_decremental = "<M-W>", -- decrement to the previous node
						scope_incremental = "<M-e>", -- increment to the upper scope (as defined in locals.scm)
					},
				},

				-- textobjects = {
				--   move = {
				--     enable = true,
				--     set_jumps = true,
				--
				--     goto_next_start = {
				--       [']p'] = '@parameter.inner',
				--       [']m'] = '@function.outer',
				--       [']]'] = '@class.outer',
				--     },
				--     goto_next_end = {
				--       [']M'] = '@function.outer',
				--       [']['] = '@class.outer',
				--     },
				--     goto_previous_start = {
				--       ['[p'] = '@parameter.inner',
				--       ['[m'] = '@function.outer',
				--       ['[['] = '@class.outer',
				--     },
				--     goto_previous_end = {
				--       ['[M'] = '@function.outer',
				--       ['[]'] = '@class.outer',
				--     },
				--   },
				--
				--   select = {
				--     enable = true,
				--     lookahead = true,
				--
				--     keymaps = {
				--       ['<leader>af'] = '@function.outer',
				--       ['<leader>if'] = '@function.inner',
				--
				--       ['<leader>ac'] = '@conditional.outer',
				--       ['<leader>ic'] = '@conditional.inner',
				--
				--       ['<leader>aa'] = '@parameter.outer',
				--       ['<leader>ia'] = '@parameter.inner',
				--
				--       ['<leader>av'] = '@variable.outer',
				--       ['<leader>iv'] = '@variable.inner',
				--     },
				--   },
				--
				--   swap = {
				--     enable = true,
				--     swap_next = swap_next,
				--     swap_previous = swap_prev,
				--   },
				-- },
				--
				-- playground = {
				--   enable = true,
				--   updatetime = 25,
				--   persist_queries = true,
				--   keybindings = {
				--     toggle_query_editor = 'o',
				--     toggle_hl_groups = 'i',
				--     toggle_injected_languages = 't',
				--
				--     -- This shows stuff like literal strings, commas, etc.
				--     toggle_anonymous_nodes = 'a',
				--     toggle_language_display = 'I',
				--     focus_language = 'f',
				--     unfocus_language = 'F',
				--     update = 'R',
				--     goto_node = '<cr>',
				--     show_help = '?',
				--   },
				-- },
				-- incremental_selection = {
				--   enable = true,
				--   keymaps = {
				--     -- init_selection = '<leader>gtis',
				--     -- node_incremental = '<leader>[',
				--     -- scope_incremental = 'gtsi',
				--     -- node_decremental = '<leader>]',
				--   },
				-- },
			})

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"html",
					"lua",
					"markdown",
					"vim",
					"vimdoc",
					"javascript",
					"typescript",
				},
				ignore_install = {},
				modules = {},
				TSConfig = {},
				sync_install = false,
				-- Autoinstall languages that are not installed
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				parser_config = {},
				-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
				-- parser_config.org = {
				--   install_info = {
				--     url = 'https://github.com/milisims/tree-sitter-org',
				--     revision = 'main',
				--     files = { 'src/parser.c', 'src/scanner.c' },
				--   },
				--   filetype = 'org',
				-- }
				refactor = {
					highlight_definitions = { enable = true },
					highlight_current_scope = { enable = false },

					-- smart_rename = {
					--   enable = false,
					--   keymaps = {
					--     -- mapping to rename reference under cursor
					--     smart_rename = 'grr',
					--   },
					-- },

					-- navigation = {
					--   enable = false,
					--   keymaps = {
					--     goto_definition = 'gnd', -- mapping to go to definition of symbol under cursor
					--     list_definitions = 'gnD', -- mapping to list all definitions in current file
					--   },
					-- },
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
						node_incremental = "<M-w>", -- increment to the upper named parent
						node_decremental = "<M-W>", -- decrement to the previous node
						scope_incremental = "<M-e>", -- increment to the upper scope (as defined in locals.scm)
					},
				},
				textobjects = {
					move = {
						enable = true,
						set_jumps = true,

						goto_next_start = {
							["]p"] = "@parameter.inner",
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[p"] = "@parameter.inner",
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},

					select = {
						enable = true,
						lookahead = true,

						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",

							["ac"] = "@conditional.outer",
							["ic"] = "@conditional.inner",

							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",

							["av"] = "@variable.outer",
							["iv"] = "@variable.inner",
						},
					},

					swap = {
						enable = true,
						swap_next = swap_next,
						swap_previous = swap_prev,
					},
				},
			})
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.org = {
				install_info = {
					url = "https://github.com/milisims/tree-sitter-org",
					revision = "main",
					files = { "src/parser.c", "src/scanner.c" },
				},
				filetype = "org",
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context", -- Plugin for sticky context
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Requires treesitter
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable the plugin
				max_lines = 0, -- Set the number of lines before the context disappears (0 for unlimited)
				min_window_height = 0, -- Minimum window height for the context window to appear
				line_numbers = false, -- Don't display line numbers in the context window
				trim_scope = true, -- Trim the context to the current scope
			})
			-- Function to disable Treesitter features (highlighting and indentation)
			local function disable_treesitter()
				require("treesitter-context").setup({
					enable = false, -- Enable the plugin
					max_lines = 0, -- Set the number of lines before the context disappears (0 for unlimited)
					min_window_height = 0, -- Minimum window height for the context window to appear
					line_numbers = false, -- Don't display line numbers in the context window
					trim_scope = true, -- Trim the context to the current scope
				})

				print("Treesitter features disabled")
			end

			-- Function to enable Treesitter features (highlighting and indentation)
			local function enable_treesitter()
				require("treesitter-context").setup({
					enable = true, -- Enable the plugin
					max_lines = 0, -- Set the number of lines before the context disappears (0 for unlimited)
					min_window_height = 0, -- Minimum window height for the context window to appear
					line_numbers = false, -- Don't display line numbers in the context window
					trim_scope = true, -- Trim the context to the current scope
				})
				print("Treesitter features enabled")
			end

			-- Toggle function: if Treesitter is enabled, disable it; if it's disabled, enable it
			local function toggle_treesitter()
				if vim.g.treesitter_enabled == nil or vim.g.treesitter_enabled == true then
					disable_treesitter()
					vim.g.treesitter_enabled = false
				else
					enable_treesitter()
					vim.g.treesitter_enabled = true
				end
			end

			-- Keybinding to toggle Treesitter features
			vim.keymap.set("n", "<leader>tt", toggle_treesitter, { noremap = true, silent = true })
			toggle_treesitter()
		end,
	},
}

-- textobjects = {
--   move = {
--     enable = true,
--     set_jumps = true, -- whether to set jumps in the jumplist
--     goto_next_start = {
--       [']m'] = '@function.outer',
--       [']]'] = { query = '@class.outer', desc = 'Next class start' },
--       --
--       -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
--       [']o'] = '@loop.*',
--       -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
--       --
--       -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
--       -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
--       [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
--       [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
--     },
--     goto_next_end = {
--       [']M'] = '@function.outer',
--       [']['] = '@class.outer',
--     },
--     goto_previous_start = {
--       ['[m'] = '@function.outer',
--       ['[['] = '@class.outer',
--     },
--     goto_previous_end = {
--       ['[M'] = '@function.outer',
--       ['[]'] = '@class.outer',
--     },
--     -- Below will go to either the start or the end, whichever is closer.
--     -- Use if you want more granular movements
--     -- Make it even more gradual by adding multiple queries and regex.
--     -- goto_next = {
--     --   [']d'] = '@conditional.outer',
--     -- },
--     -- goto_previous = {
--     --   ['[d'] = '@conditional.outer',
--     -- },
--   },
-- },
