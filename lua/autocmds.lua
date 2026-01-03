require "nvchad.autocmds"


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp" },
  callback = function()
    vim.opt_local.tabstop = 2        -- tab দেখাবে 4 space
    vim.opt_local.shiftwidth = 2     -- indent = 4
    vim.opt_local.softtabstop = 2    -- tab/backspace = 4
    vim.opt_local.expandtab = true   -- tab মানে space
  end,
})


