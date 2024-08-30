-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "jdtls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- elixir
-- lspconfig.elixirls.setup({
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
-- 	cmd = { "/home/shanu/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
-- })
--
-- lspconfig.nextls.setup({
-- 	cmd = { "nextls", "--stdio" },
-- 	init_options = {
-- 		extensions = {
-- 			credo = { enable = true },
-- 		},
-- 		experimental = {
-- 			completions = { enable = true },
-- 		},
-- 	},
-- })
--
-- Without the loop, you would have to manually set up each LSP just like above
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
