require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>rt", function()
  for _, c in ipairs(vim.lsp.get_active_clients()) do
    if c.name:lower():match("rust") then
      vim.lsp.stop_client(c.id)
      vim.notify("rust-analyzer OFF")
      return
    end
  end

  vim.diagnostic.enable()
  require("lspconfig").rust_analyzer.manager.try_add()
  vim.notify("rust-analyzer ON")
end, { desc = "Toggle rust-analyzer" })

vim.keymap.set("n", "<leader>u", "gUiwEa", {
  desc = "Uppercase word and append at word end"
})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
