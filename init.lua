vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = "Exit terminal mode with jk" })

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

local unpack = unpack or table.unpack

local function convert_case(type)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local word = vim.fn.expand("<cword>")
  if word == "" then return end

  local result = word

  -- snake_case → camelCase
  if word:find("_") then
    result = word:gsub("_([a-z])", function(l)
      return l:upper()
    end)
  end

  -- first letter handling
  if type == "capital" then
    result = result:gsub("^%l", string.upper)
  elseif type == "small" then
    result = result:gsub("^%u", string.lower)
  end

  -- replace word under cursor
  local start_col = col
  local end_col = col + #word

  vim.api.nvim_buf_set_text(
    0,
    row - 1,
    start_col,
    row - 1,
    end_col,
    { result }
  )
end

vim.keymap.set("n", "<Leader>sc", function()
  convert_case("small")
end, { desc = "camelCase" })

vim.keymap.set("n", "<Leader>cc", function()
  convert_case("capital")
end, { desc = "PascalCase" })

