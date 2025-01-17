-- credits/reference https://github.com/JustBarnt/NvaderVIM/blob/c6fa2c2aff33f31a519711daa1710604549241f2/lua/core/utils/init.lua#L93

local api = vim.api
local U = {}

--- Applies all values to `vim.[scope][setting]`
---@param options table A Table of options to pass to it
function U.vim_options(options)
	if options ~= nil then
		for scope, table in pairs(options) do
			for setting, value in pairs(table) do
				vim[scope][setting] = value
			end
		end
	end
end

--- Returns the current Mode and formats it
function U.map_mode()
	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" then
		return "NML "
	elseif mode == "i" then
		return "INS "
	elseif mode == "v" or mode == "V" or mode == "^V" then
		return "VIS "
	elseif mode == "c" then
		return "CMD "
	elseif mode == "t" then
		return "TERM"
	else
		return mode
	end
end

--- Returns the RGB Color string from a highlight group
---@param color string
function U.get_rbg_from_hl(color)
	return string.format("#%06x", color)
end

--- Returns true if the buffer is large than X size
---@param bufnr integer The buffer to check
---@param size integer The max size allowed in bytes
---@return boolean
function U.is_large_buffer(bufnr, size)
	local is_large_buf = false
	local max_filesize = size * 1024
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		is_large_buf = true
	end

	return is_large_buf
end

--- Returns the users plugin spec from `user.config` or an empty table if it is not defined in the `user.config`
---@param plugin_name string the name of the plugin to search for in `user.config`
---@param opts table the default opts used by the plugin
function U.create_spec(plugin_name, opts)
	local exists, user_config = pcall(require, "user.config")
	local plugins = exists and type(user_config) == "table" and user_config.plugins or {}
	return vim.tbl_deep_extend("force", opts, plugins[plugin_name] or {})
end

--- Returns a window id if there is a window in the direction given
---@param direction string The direction to check for a window
function U.get_window_location(direction)
	local current_win = api.nvim_get_current_win()

	local win_info = api.nvim_list_wins()
	for _, win_id in ipairs(win_info) do
		---@class vim.api.keyset.win_config
		---@diagnostic disable-next-line: assign-type-mismatch
		local win_config = api.nvim_win_get_config(win_id)
		local win_split = win_config.split

		if direction == "up" and win_split == "above" then
			return win_id
		elseif direction == "down" and win_split == "below" then
			return win_id
		elseif direction == "left" and win_split == "left" then
			return win_id
		elseif direction == "right" and win_split == "right" then
			return win_id
		end
	end

	return nil
end

--- Sets the Telescope find_files picker to RipGrep on windows if
--- the user is on windows
---@param executable integer Interger value if command is found
function U.select_find_command(executable)
	local rg_command = {
		initial_mode = "insert",
		hidden = true,
		no_ignore = true,
		file_ignore_patterns = {
			"node_modules",
			".git",
			".svn",
			".svelte-kit",
			"build",
		},
		find_command = {
			"rg",
			"--files",
			"--color=never",
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!{.git/*,.svelte-kit/*,target/*,node_modules/*}",
			"--path-separator",
			"/",
		},
	}

	local fd_command = {
		initial_mode = "insert",
		find_command = vim.fn.executable == 1 and {
			"fd",
			"--type=f",
			"--color=never",
			"--path-separator=/",
			"--hidden",
			"--include",
			"lua/**/user/*",
			"--exclude",
			"!{.git/*,.svelte-kit/*,target/*,node_modules/*}, lua/user/*",
			-- "--strip-cwd-prefix",
		},
	}

	if executable ~= 1 then
		return rg_command
	else
		return fd_command
	end
end

--- Wrapper for `vim.keymap.set`
---@param mode string Mode the keymap can work in
---@param lhs string The left hand side AKA: Key combination to activate
---@param rhs string|function The right hand side AKA: The action to invoke
---@param opts? table A table of options the `vim.keymap.set` supports
function U.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

--- Controls the opt-in functionality of plugins, commands, and other items
--- IF the group is not found, or the opt is not found or the opt is found but not false
--- it will be enabled
---@param group_name string A key to a table of available modules to opt in or out of
---@param opt string Augroup or plugin to disable
---@return boolean
function U.enabled(group_name, opt)
	local exists, user_config = pcall(require, "user.config")
	local opt_outs = exists and type(user_config) == "table" and user_config["features"] or {}
	local group = opt_outs[group_name] or {}

	return group == nil or group[opt] == nil or group[opt] == true
end

--- Simpler autocmd function call
---@param args table A table of args matching the `vim.api.nvim_create_autocmd` signature
function U.autocmd(args)
	local event = args[1]
	local group = args[2]
	local callback = args[3]

	vim.api.nvim_create_autocmd(event, {
		group = group,
		buffer = args[4],
		callback = function()
			callback()
		end,
		once = args.once,
	})
end

return U
