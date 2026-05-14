local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    h = { "clang_format" },
    hpp = { "clang_format" },
    rust = { "rustfmt" },
    go = { "goimports", "gofmt" },
  },

  formatters = {
    clang_format = {
      prepend_args = {
        "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
      },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
