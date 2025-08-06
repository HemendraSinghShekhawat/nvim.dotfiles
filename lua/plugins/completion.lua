-- local has_words_before = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	if col == 0 then
-- 		return false
-- 	end
-- 	local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
-- 	return text:sub(col, col):match("%s") == nil
-- end
--
-- return {
-- 	{
-- 		"saghen/blink.cmp",
-- 		-- optional: provides snippets for the snippet source
-- 		dependencies = { "rafamadriz/friendly-snippets" },
--
-- 		-- use a release tag to download pre-built binaries
-- 		version = "1.*",
-- 		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- 		-- build = "cargo build --release",
-- 		-- If you use nix, you can build from source using latest nightly rust with:
-- 		-- build = 'nix run .#build-plugin',
--
-- 		---@module 'blink.cmp'
-- 		---@type blink.cmp.Config
-- 		opts = {
-- 			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
-- 			-- 'super-tab' for mappings similar to vscode (tab to accept)
-- 			-- 'enter' for enter to accept
-- 			-- 'none' for no mappings
-- 			--
-- 			-- All presets have the following mappings:
-- 			-- C-space: Open menu or open docs if already open
-- 			-- C-n/C-p or Up/Down: Select next/previous item
-- 			-- C-e: Hide menu
-- 			-- C-k: Toggle signature help (if signature.enabled = true)
-- 			--
-- 			-- See :h blink-cmp-config-keymap for defining your own keymap
-- 			keymap = {
-- 				preset = "none",
-- 				["<C-;>"] = { "show", "show_documentation", "hide_documentation" },
-- 				["<C-e>"] = { "cancel", "fallback" },
-- 				["<C-y>"] = { "select_and_accept" },
--
-- 				["<Up>"] = { "select_prev", "fallback" },
-- 				["<Down>"] = { "select_next", "fallback" },
-- 				["<C-p>"] = {
-- 					function(cmp)
-- 						local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
-- 						local char_undor_cursor = vim.api.nvim_get_current_line():sub(cursor_col, cursor_col)
-- 						-- Fallback to the default behavior, if on whitespace
-- 						if not has_words_before() then
-- 							return
--
-- 						-- Cancel if we're on the first item
-- 						elseif cmp.get_selected_item_idx() == 1 then
-- 							vim.schedule(function()
-- 								require("blink.cmp.completion.list").undo_preview()
-- 								require("blink.cmp.completion.trigger").hide()
-- 							end)
--
-- 						-- Otherwise, select prev
-- 						else
-- 							vim.schedule(function()
-- 								require("blink.cmp.completion.list").select_prev()
-- 							end)
-- 						end
-- 						return true
-- 					end,
-- 					"fallback",
-- 				},
-- 				["<C-n>"] = {
-- 					function(cmp)
-- 						local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
-- 						local char_undor_cursor = vim.api.nvim_get_current_line():sub(cursor_col, cursor_col)
-- 						-- Fallback to the default behavior, if on whitespace
-- 						if not has_words_before() then
-- 							return
--
-- 						-- Request and show the first item, if we have no items
-- 						elseif #cmp.get_items() == 0 then
-- 							cmp.show_and_insert()
--
-- 						-- Otherwise, select the next item
-- 						else
-- 							vim.schedule(function()
-- 								require("blink.cmp.completion.list").select_next()
-- 							end)
-- 						end
-- 						return true
-- 					end,
-- 					"fallback",
-- 				},
-- 				-- { "select_prev", "fallback_to_mappings" },
-- 				-- { "select_next", "fallback_to_mappings" },
--
-- 				["<C-b>"] = { "scroll_documentation_up", "fallback" },
-- 				["<C-f>"] = { "scroll_documentation_down", "fallback" },
--
-- 				["<Tab>"] = { "snippet_forward", "fallback" },
-- 				["<S-Tab>"] = { "snippet_backward", "fallback" },
--
-- 				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
-- 			},
--
-- 			completion = {
-- 				trigger = {
-- 					prefetch_on_insert = false,
-- 					show_in_snippet = true,
-- 					show_on_keyword = false,
-- 					show_on_backspace = false,
-- 					show_on_backspace_in_keyword = false,
-- 					show_on_backspace_after_accept = true,
-- 					show_on_backspace_after_insert_enter = true,
-- 					show_on_trigger_character = true,
-- 					show_on_insert = false,
-- 					show_on_blocked_trigger_characters = { " ", "\n", "\t" },
-- 					show_on_accept_on_trigger_character = true,
-- 					show_on_insert_on_trigger_character = true,
-- 					show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "[" },
-- 				},
-- 				documentation = { auto_show = false },
-- 				ghost_text = {
-- 					enabled = true,
-- 					-- Show the ghost text when no item has been selected, defaulting to the first item
-- 					show_without_selection = true,
-- 				},
-- 				-- list = { selection = { preselect = false } },
-- 			},
--
-- 			-- Default list of enabled providers defined so that you can extend it
-- 			-- elsewhere in your config, without redefining it, due to `opts_extend`
-- 			sources = {
-- 				default = { "lsp", "path", "snippets", "buffer" },
-- 			},
--
-- 			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
-- 			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
-- 			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
-- 			--
-- 			-- See the fuzzy documentation for more information
-- 			fuzzy = { implementation = "prefer_rust_with_warning" },
-- 		},
-- 		opts_extend = { "sources.default" },
-- 	},
-- }

return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = "cargo build --release",
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "none",
				["<C-;>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "cancel", "fallback" },
				["<C-y>"] = { "select_and_accept" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				trigger = {
					prefetch_on_insert = false,
					show_in_snippet = true,
					show_on_keyword = false,
					show_on_backspace = false,
					show_on_backspace_in_keyword = false,
					show_on_backspace_after_accept = true,
					show_on_backspace_after_insert_enter = true,
					show_on_trigger_character = true,
					show_on_insert = false,
					show_on_blocked_trigger_characters = { " ", "\n", "\t" },
					show_on_accept_on_trigger_character = true,
					show_on_insert_on_trigger_character = true,
					show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "[" },
				},
				documentation = { auto_show = false },
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
