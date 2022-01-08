vim.g.mapleader = ','

local options = {
  backup = false,
  clipboard = 'unnamedplus',
  cmdheight = 2,
  conceallevel = 0,
  fileencoding = 'utf-8',
  pumheight = 10,
  number  = true,
  relativenumber = true,
  wrap = false,
  expandtab = true ,
  incsearch = true,
  tabstop = 2,
  cursorline = true,
  ignorecase = true,
  hlsearch = false,
  swapfile = false,
  splitbelow = true,
  splitright = true,
  scrolloff = 8,
  errorbells = false,
  shiftwidth = 2,
  numberwidth = 4,
  termguicolors = true,
  showtabline = 4,
  signcolumn = 'yes',
  showmode = false,
  mouse = 'a',
  smartindent = true,
  timeoutlen = 100,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  sidescrolloff = 8,
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] --TODO: this doesn't seem to work

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-N>', ':Lexplore<CR> :vertical resize 30<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':sp<CR> :term<CR> :resize 20N<CR> i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- better whitespace
vim.api.nvim_set_keymap('n', 'öä', ':StripWhitespace<CR>', { noremap = true, silent = true })
-- move line up or down with alt-(up/down)
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Down>', ':m .+1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Up>', ':m .-1<CR>', { noremap = true, silent = true })

vim.g['netrw_winsize'] = 25
vim.g['netrw_liststyle'] = 3
