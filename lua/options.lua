require "nvchad.options"

-- add yours here!

vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.timeout = true 
vim.opt.timeoutlen = 500
-- C / C++ indentation (4 spaces)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
