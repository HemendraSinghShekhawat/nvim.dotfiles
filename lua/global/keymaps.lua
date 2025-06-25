local set = vim.keymap.set
-- local keymapfn = require("custom.keymaps")
-- local fn = keymapfn.fn
-- local emptyFunction = keymapfn.emptyFn

local keymaps = {
	{ "n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "nohlsearch" } },
	{ "n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" } },
	{ "n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" } },
	{ "n", "<leader>l", "$", { desc = "To end of line" } },
	{ "n", "<leader>h", "_", { desc = "To start of line" } },
	{ "t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" } },
	{ "n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" } },
	{ "n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" } },
	{ "n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" } },
	{ "n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" } },

	-- NOTE: below keymaps are reference from https://github.com/alexjercan/nvim.dotfiles/blob/master/nvim/lua/neovim/remap.lua
	--
	-- cool move line in visual mode
	{ "v", "J", ":m '>+1<CR>gv=gv" },
	{ "v", "K", ":m '<-2<CR>gv=gv" },

	-- better moves
	{ "n", "J", "mzJ`z" },
	{ "n", "<C-d>", "<C-d>zz" },
	{ "n", "<C-u>", "<C-u>zz" },
	{ "n", "n", "nzzzv" },
	{ "n", "N", "Nzzzv" },

	{ "n", "<C-k>", "<cmd>cprev<CR>zz" },
	{ "n", "<C-j>", "<cmd>cnext<CR>zz" },
	{ "n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list" } },
	{ "n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list" } },

	-- diagnostics
	-- { "n", "]d", fn(vim.diagnostic.goto_next, { float = true }), { desc = "Next diagnostic" } },
	-- { "n", "[d", fn(vim.diagnostic.goto_prev, { float = true }), { desc = "Previous diagnostic" } },

	-- My original ideas
	{ "n", "<leader>b[", "<cmd>bp<CR>", { desc = "Previous buffer" } },
	{ "n", "<leader>b]", "<cmd>bn<CR>", { desc = "Next buffer" } },
	{ "n", "<leader>bd", "<cmd>bd<CR>", { desc = "delete buffer" } },
	{ "n", "-", "<cmd>Oil<CR>", { desc = "directory" } },

	{ "n", "<leader><CR>", "<cmd>luafile %:p<CR>" },
}

-- set("n", "<space>tt", function()
-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
-- end)

-- vim.api.nvim_set_keymap("n", "<leader>t", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

set("n", "j", function()
	local count = vim.v.count

	if count == 0 then
		return "gj"
	else
		return "j"
	end
end, { expr = true })

set("n", "k", function()
	local count = vim.v.count

	if count == 0 then
		return "gk"
	else
		return "k"
	end
end, { expr = true })

local function map(mode, new_binding, function_to_bind_with, options)
	vim.keymap.set(mode, new_binding, function_to_bind_with, options)
end

for _, mapping in ipairs(keymaps) do
	map(mapping[1], mapping[2], mapping[3], mapping[4])
end
