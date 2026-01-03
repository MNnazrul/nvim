return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy", -- দ্রুত লোড হওয়ার জন্য
    config = function()
      require("smear_cursor").setup({
        -- আপনি চাইলে এখানে কাস্টম কনফিগারেশন যোগ করতে পারেন
      })
    end,
  },

   --  {
  --   "karb94/neoscroll.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require('neoscroll').setup({
  --       -- Example: only map <C-u> and <C-d>
  --       mappings = {'<C-u>', '<C-d>'},
  --       easing = 'quadratic',
  --     })
  --   end,
  -- },
-- {
--   "simrat39/rust-tools.nvim",
--   ft = "rust",
--   config = function()
--     local rt = require("rust-tools")
--     rt.setup({
--       tools = {
--         inlay_hints = {
--           auto = true,         -- enable inlay hints
--           only_current_line = false,
--         },
--       },
--       server = {
--         settings = {
--           ["rust-analyzer"] = {
--             inlayHints = { typeHints = true, parameterHints = true }
--           }
--         }
--       }
--     })
--   end
-- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
