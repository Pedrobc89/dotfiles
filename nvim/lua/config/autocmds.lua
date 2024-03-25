-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable automatically comment on next line
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Copy to system clipboard
vim.cmd [[au TextYankPost * silent! lua vim.fn.system('echo -n "'..vim.fn.getreg('+')..'" | tmux set-buffer')]]
