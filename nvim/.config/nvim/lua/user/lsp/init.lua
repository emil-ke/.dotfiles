local status_ok_lsp, lsp = pcall(require, "lspconfig")
if not status_ok_lsp then
  return
end
--[[
local status_ok_completion, _ = pcall(require, "completion")
if not status_ok_completion then
  return
end
]]--
local custom_attach = function ()
  completion.on.attach()

  vim.api.nvim_buf_set_options(bufnr, "omnifunc", 'v:lua.vim.lsp.omnifunc')
end

lsp.pylsp.setup{on_attach = custom_attach}

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
