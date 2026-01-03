require("nvchad.configs.lspconfig").defaults()

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   cmd = {
--     "clangd",
--     "--query-driver=/usr/bin/g++", -- আপনার পাওয়া পাথটি এখানে দিন
--     "--background-index",
--     "--clang-tidy",
--   },
-- }
--

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
-- vim.lsp.enable('clangd')



-- read :h vim.lsp.config for changing options of lsp servers 
