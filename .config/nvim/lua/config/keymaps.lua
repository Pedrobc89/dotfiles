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

-- SSH Clipboard helper mappings
local is_ssh = vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil or vim.env.SSH_TTY ~= nil
if is_ssh then
  vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
  vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
  vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
  vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })
end