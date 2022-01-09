require('plugins')
require('basics')
require('colors')
require('telescope-config')
require('coc-config')
require('lualine').setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

