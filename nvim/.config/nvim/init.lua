local options = {
	number = true,
	tabstop = 2,
	signcolumn = "yes",
	swapfile = false,
	winborder = "rounded",
	termguicolors = true,
	ignorecase = true,
}

for opt, val in pairs(options) do
	vim.o[opt] = val
end

vim.pack.add({
	"https://github.com/vague2k/vague.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/echasnovski/mini.pick",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/emil-ke/true-zen.nvim", -- my fork (fixed)
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


vim.lsp.enable({ "lua_ls", "gopls" })


vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

require "mini.pick".setup()
require "oil".setup()


-- mappings
vim.g.mapleader = " "
local map = vim.keymap.set

map('n', '<leader>so', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<C-ö>', '<Cmd>Open .<CR>')
map('n', '<leader>s', '<Cmd>e #<CR>')
map('n', '<leader>S', '<Cmd>bot sf #<CR>')
map('n', 'qq', ":noh<CR>")

map('n', 'gm', ":call cursor(0, len(getline('.'))/2)<CR>")
map('n', 'ge', ":call cursor(0, len(getline('.')))<CR>")
map('n', 'gs', ":call cursor(0, 0)<CR>") -- or use 0, maybe easier

map({ 'v', 'x', 'n' }, '<leader>y', '"+y<CR>')
map({ 'v', 'x', 'n' }, '<leader>d', '"+d<CR>')

map('n', '<leader>g', ":Pick grep_live<CR>")
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>za', ':TZAtaraxis<CR>')

map('n', '<leader>lf', vim.lsp.buf.format)
