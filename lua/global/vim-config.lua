-- credit: https://github.com/SylvanFranklin/.config/blob/main/nvim/init.lua :) --
vim.opt.winborder = "single"
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
-- end credit

vim.o.colorcolumn = "82"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.opt.guifont = { "Iosevka", ":h12" }
vim.opt.relativenumber = true
-- vim opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.listchars = { tab = "│ ", trail = ".", nbsp = "␣" }
vim.o.tabstop = 2

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

vim.opt.shellslash = true
-- vim.opt.shell = "pwsh"
vim.opt.shell = "bash"
vim.cmd("set shellcmdflag=-c")
vim.cmd('set shellxquote="')
-- vim.opt.shellcmdflag = "-c"
-- vim.opt.shellxquote = '"'
-- Enable file size display in netrw
vim.g.netrw_liststyle = 1 -- Use long listing format
vim.g.netrw_banner = 0 -- Hide the banner
vim.g.netrw_list_cmd = "ls -FLa"
vim.o.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait100-blinkon100-blinkoff100-Cursor/lCursor"
