-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

vim.keymap.set("n", "<leader>e", function()
  vim.cmd("Explore " .. require("lazyvim.util").root())
end, { desc = "Explorer (root)" })

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("Explore")
end, { desc = "Explorer (reveal)" })