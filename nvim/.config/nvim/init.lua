local options = {
	number = true,
	shiftwidth = 2,
	tabstop = 2,
	signcolumn = "yes",
	swapfile = false,
	winborder = "rounded",
	termguicolors = true,
	ignorecase = true,
	smartcase = true,
	smarttab = true,
	updatetime = 250,
	linebreak = true,
	breakindent = true,
	wrap = true,
}

for opt, val in pairs(options) do
	vim.o[opt] = val
end

vim.pack.add({
	"https://github.com/vague2k/vague.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/BurntSushi/ripgrep",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/emil-ke/true-zen.nvim", -- my fork (fixed)
	"https://github.com/chomosuke/typst-preview.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.cmd("set completeopt+=noselect")


vim.lsp.enable({
	"lua_ls",
	"gopls",
	"ruff",
	"clangd",
	"tinymist",
	"eslint",
	"ts_ls",
	"jsonls",
	"cssls",
	"gdscript",
	"svelte",
	"astro",
})

require "nvim-treesitter.configs".setup {
	ensure_installed = { "lua", "typescript", "svelte", "html", "css", "javascript", "gdscript", },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}


vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
require "oil".setup()
require "telescope".setup {
	pickers = {
		find_files = {
			theme = "ivy"
		},

	}
}


-- mappings
vim.g.mapleader = " "
local map = vim.keymap.set

map('n', '<leader>so', ':update<CR> :source<CR>')
map('n', '<leader>w', ':update<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>c', ':bp | bd #<CR>')
map('n', '<C-ö>', '<Cmd>Open .<CR>')
map('n', '<leader>s', '<Cmd>e #<CR>')
map('n', '<leader>S', '<Cmd>bot sf #<CR>')
map('n', 'qq', ":nohlsearch<CR>")
map('n', '<leader>lb', ":b#<CR>")

map('n', "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map('n', "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")

map('n', 'gm', ":call cursor(0, len(getline('.'))/2)<CR>")

map({ 'v', 'x', 'n' }, '<leader>y', '"+y<CR>')
map({ 'v', 'x', 'n' }, '<leader>d', '"+d<CR>')

map('n', '<leader>f', ":Telescope find_files<CR>")
map('n', '<leader>g', ":Telescope live_grep<CR>")
map('n', '<leader>h', ":Telescope help_tags<CR>")
map('n', '<leader>b', ":Telescope buffers<CR>")

map('n', '<leader>e', ":Oil<CR>")

map('n', '<leader>za', ":TZAtaraxis <CR>")

map('n', '<leader>lf', vim.lsp.buf.format)

map('n', '<leader><C-p>', ":TypstPreviewToggle <CR>")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

map('n', '<leader>ä', vim.diagnostic.open_float)
map('n', '<leader>ö', vim.diagnostic.setloclist)


vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.gd",
	command = "silent !gdformat %",
})


vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.gdshader",
	command = "silent !clang-format -i %", -- clang-format seems to work well for this
})

-- if editing a single file in ataraxis mode and run :quit, this makes it so that nvim just closes.
-- if multiple buffers are open, it behaves normally.
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local ok, ataraxis = pcall(require, "true-zen.ataraxis")
		if not ok then return end
		if ataraxis.running then
			local listed_bufs = vim.fn.getbufinfo({ buflisted = 1 })
			if #listed_bufs == 1 then
				vim.schedule(function()
					vim.cmd("qa")
				end)
			end
		end
	end,
})
