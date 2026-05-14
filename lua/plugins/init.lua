return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  { "oonamo/ef-themes.nvim" },

  {
    "github/copilot.vim",
    event = "InsertEnter",
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
      vim.g.rustfmt_autosave = 0
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
    ft = { "toml" },
    config = function()
      require("crates").setup({
        completion = {
          crates = { enabled = true },
        },
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      })
    end,
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
  {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    indent = { char = "│" },
    scope = { enabled = true },
  },
  config = function(_, opts)
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblIndent", { link = "Comment" })
      vim.api.nvim_set_hl(0, "IblScope",  { link = "Statement" })
    end)

    opts.indent.highlight = "IblIndent"
    opts.scope.highlight  = "IblScope"

    require("ibl").setup(opts)
  end,
},

  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,      -- start-up এ load হবে
    priority = 1000,   -- colorscheme আগে load করার জন্য
    config = function()
      vim.cmd.colorscheme("gruber-darker")
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    dir = "~/Desktop/projects/source-controller",
    cmd = { "SourceControl", "SourceControlOpen", "SourceControlClose" },
    keys = {
      { "<leader>sc", "<cmd>SourceControl<cr>", desc = "Source Control" },
    },
  }

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
