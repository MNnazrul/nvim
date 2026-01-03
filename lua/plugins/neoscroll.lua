return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      local neoscroll = require("neoscroll")

      -- Disable default mappings
      neoscroll.setup({
        mappings = {},
      })

      local map = vim.keymap.set
      local opts = { silent = true }

      -- Half / full page scrolling
      map("n", "<C-u>", function()
        neoscroll.ctrl_u({ duration = 250 })
      end, opts)

      map("n", "<C-d>", function()
        neoscroll.ctrl_d({ duration = 250 })
      end, opts)

      map("n", "<C-b>", function()
        neoscroll.ctrl_b({ duration = 400 })
      end, opts)

      map("n", "<C-f>", function()
        neoscroll.ctrl_f({ duration = 400 })
      end, opts)

      -- 2-line smooth scroll
      map("n", "<C-y>", function()
        neoscroll.scroll(-1, { move_cursor = false, duration =10 })
      end, opts)

      map("n", "<C-e>", function()
        neoscroll.scroll(1, { move_cursor = false, duration = 10 })
      end, opts)

      -- Cursor positioning
      map("n", "zz", function()
        neoscroll.zz({ half_win_duration = 250 })
      end, opts)

      map("n", "zt", function()
        neoscroll.zt({ half_win_duration = 250 })
      end, opts)

      map("n", "zb", function()
        neoscroll.zb({ half_win_duration = 250 })
      end, opts)

      -- File navigation
      -- map("n", "gg", function()
      --   neoscroll.gg({ half_win_duration = 300})
      -- end, opts)
      --
      -- map("n", "G", function()
      --   neoscroll.G({ half_win_duration = 300 })
      -- end, opts)
    end,
  },
}

