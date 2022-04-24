-- variables for readability
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

local options = {
	syntax = "on",
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	conceallevel = 0,
	fileencoding = "utf-8",
	pumheight = 10,
	number = true,
	relativenumber = false,
	wrap = false,
	expandtab = true,
	tabstop = 2,
	cursorline = true,
	ignorecase = true,
	smartcase = true,
	hlsearch = true,
	swapfile = false,
	splitbelow = true,
	splitright = true,
	scrolloff = 8,
	errorbells = false,
	shiftwidth = 2,
	numberwidth = 4,
	termguicolors = true,
	showtabline = 4,
	signcolumn = "yes",
	showmode = false,
	mouse = "a",
	smartindent = false,
	timeoutlen = 100,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	sidescrolloff = 8,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) --TODO: this doesn't seem to work
vim.cmd([[set nogdefault]])

keymap("n", "vs", ":vs<CR>", opts) -- vs to split vertically
keymap("n", "sp", ":sp<CR>", opts) -- sp to split horizontally

-- navigation between windows
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-J>", "<C-W><C-J>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "tn", ":tabnew<CR>", opts) -- tn to open new tab
keymap("n", "tk", ":tabnext<CR>", opts) -- tk - move to next tab
keymap("n", "tj", ":tabprev<CR>", opts) -- tj - more to prev tab
keymap("n", "to", ":tabo<CR>", opts) -- close all other open tabs

keymap("n", "<C-S>", ":%s/", opts) -- replace string (syntax *string to be replaced*/*new string*)
keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", opts) -- open terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- makes sure esc key works in terminal

-- better whitespace
keymap("n", "<leader>ö", ":StripWhitespace<CR>", opts) -- <leader>w to strip whitespace (remove whitespace)

-- move line up or down with
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)
keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<", "<gv", opts)
keymap("n", ">", ">gv", opts)

-- when you yank something and overwrite something else nvim normally kind of yanks whatever you overwrite,
-- this command makes sure you keep whatever you originally yanked
keymap("v", "p", '"_dP', opts)

-- Formating
keymap("n", "fo", ":Format<CR>", opts)
keymap("v", "fo", ":Format<CR>", opts)

keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)

vim.g["netrw_winsize"] = 25
vim.g["netrw_liststyle"] = 3
