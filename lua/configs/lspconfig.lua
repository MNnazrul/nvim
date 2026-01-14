-- lua/configs/lspconfig.lua

local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local servers = {
  html = {},

  cssls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  },

  clangd = {
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  vim.lsp.config(name, opts)
end

-- enable all of them (NvChad docs show this pattern)
vim.lsp.enable(vim.tbl_keys(servers))

