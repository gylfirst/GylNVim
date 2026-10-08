local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation des fenêtres
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Général
map("n", "<leader>h", ":nohlsearch:<CR>", opts)
map("n", "<leader>t", ":Neotree dir=./<CR>", opts)
map("n", "<C-n>", ":Neotree filesystem reveal left<CR>", opts)
map("n", "<leader>bf", ":Neotree buffers reveal float<CR>", opts)

-- Telescoppe
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader><leader>", "<cmd>Telescope oldfiles<CR>", opts)

-- LSP
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>gd", vim.lsp.buf.definition, opts)
map("n", "<leader>gr", vim.lsp.buf.references, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>gf", vim.lsp.buf.format, opts)

-- Debug
map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, opts)
map("n", "<leader>c", function()
	require("dap").continue()
end, opts)

-- Venv
map("n", "<leader>v", "<cmd>VenvSelect<CR>", opts)

return {}
