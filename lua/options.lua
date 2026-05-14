require "nvchad.options"

-- add yours here!

vim.opt.relativenumber = true
vim.opt_local.tabstop = 4

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.timeout = true 
vim.opt.timeoutlen = 500
-- Systems languages: 4-space indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp", "rust", "zig" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- Go: real tabs, width 4 (gofmt convention)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gosum", "gowork" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = false
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
