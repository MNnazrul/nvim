require("nvchad.configs.lspconfig").defaults()

local lspconfig = require('lspconfig') 
-- HTML
lspconfig.html.setup {}

-- CSS
lspconfig.cssls.setup {}

-- Python (pyright)
lspconfig.pyright.setup {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- "strict" চাইলে করো
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}

