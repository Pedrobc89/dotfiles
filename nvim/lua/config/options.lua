-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.autoformat = false
vim.o.conceallevel = 0

-- Set colorcolumn = 80
vim.opt.colorcolumn = "80"

-- if local_options.lua is present, it will override this file
if vim.loop.fs_stat(vim.fn.stdpath("config").."/lua/config/local_options.lua") then
  require("config.local_options")
end
