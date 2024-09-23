-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Disable Move Lines
map("n", "<A-j>", "<Nop>", { desc = "Move down disbled" })
map("n", "<A-k>", "<Nop>", { desc = "Move up" })
map("i", "<A-j>", "<Nop>", { desc = "Move down" })
map("i", "<A-k>", "<Nop>", { desc = "Move up" })
map("v", "<A-j>", "<Nop>", { desc = "Move down" })
map("v", "<A-k>", "<Nop>", { desc = "Move up" })

-- Don't know why key config inside the plugin doesn't work
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Navigate left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Navigate right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Navigate down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Navigate up" })

-- Fugitive remap to 3way merge
map("n", "<leader><", ":diffget //2<CR>", { desc = "3way merge left" })
map("n", "<leader>>", ":diffget //3<CR>", { desc = "3way merge right" })

--buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
