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

local function convert_case(type)
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local word = vim.fn.expand('<cword>')
  
  if word == "" then return end

  local result = word
  
  -- যদি snake_case হয় তবে camelCase এ রূপান্তর করবে
  if word:find('_') then
    result = word:gsub('(_)([a-z])', function(_, l)
      return l:upper()
    end)
    result = result:gsub('_', '') -- বাকি আন্ডারস্কোর মুছে ফেলবে
  end
  
  -- কেস টাইপ অনুযায়ী প্রথম অক্ষর প্রসেস করা
  if type == "capital" then
    -- প্রথম অক্ষর বড় হাতের করবে (PascalCase)
    result = result:gsub("^%l", string.upper)
  elseif type == "small" then
    -- প্রথম অক্ষর ছোট হাতের করবে (camelCase)
    result = result:gsub("^%u", string.lower)
  end
  
  -- টেক্সট রিপ্লেস করা
  local match_data = vim.fn.matchstrpos(vim.fn.getline('.'), word)
  local start_col = match_data[2]
  local end_col = match_data[3]
  
  if start_col ~= -1 then
    vim.api.nvim_buf_set_text(0, line - 1, start_col, line - 1, end_col, {result})
  end
end

-- কি-ম্যাপিংস
vim.keymap.set('n', '<Leader>sc', function() convert_case("small") end, { desc = "Convert to small camelCase" })
vim.keymap.set('n', '<Leader>cc', function() convert_case("capital") end, { desc = "Convert to Capital CamelCase" })

