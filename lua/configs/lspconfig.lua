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

  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          shadow = true,
          nilness = true,
          unusedwrite = true,
          useany = true,
        },
        staticcheck = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
    },
    filetypes = { "c", "h", "cpp", "hpp", "objc", "objcpp" },
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

