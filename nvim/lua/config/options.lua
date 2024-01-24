-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.autoformat = false
vim.o.conceallevel = 0

-- Set colorcolumn = 80
vim.opt.colorcolumn = "100"

-- Add 3rdparty/python/configs/  to runtimepath to allow for python linters to work
vim.opt.runtimepath:append("./3rdparty/python/configs/")

vim.cmd([[
  let g:python3_host_prog = '/home/pedro/Documents/Development/IBM/repos/techlabs/dist/export/python/virtualenvs/python-repository/3.8.16'
]])
