local fn = vim.fn
local path_sep = (fn.has("win32") == 1 or fn.has("win64") == 1) and "\\" or "/"
local home_dir = fn.expand("~")

local backup_dir = home_dir .. path_sep .. "nvim-backups"
local undo_dir = home_dir .. path_sep .. "nvim-undos"
local swap_dir = home_dir .. path_sep .. "nvim-swaps"

-- Create directories if they don't exist
fn.mkdir(backup_dir, "p")
fn.mkdir(undo_dir, "p")
fn.mkdir(swap_dir, "p")

-- Set backup options
vim.opt.backup = true
vim.opt.backupdir = backup_dir
vim.opt.directory = swap_dir
vim.opt.undodir = undo_dir
