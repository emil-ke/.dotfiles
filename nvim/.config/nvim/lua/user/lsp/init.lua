local status_ok_lsp, _ = pcall(require, "lspconfig")
if not status_ok_lsp then
	return
end

local status_ok, _ = pcall(require, "completion")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
