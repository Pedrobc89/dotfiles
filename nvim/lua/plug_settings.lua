vim.cmd('colorscheme base16-classic-dark')

local keymap = vim.keymap.set
keymap('n', '<Leader>n', ':NERDTreeToggle<cr>', {silent = true})
keymap('n', '<Leader>r', ':NERDTreeFind<cr>', {silent = true})

keymap('n', '<Leader><', ':diffget //2<cr>', { noremap = true, silent = true})
keymap('n', '<Leader>>', ':diffget //3<cr>', { noremap = true, silent = true})

-- Automatically sets colorscheme based on shell theme
--if filereadable(expand("~/.vimrc_background"))
--  let base16colorspace=256
--  source ~/.vimrc_background
--endif

-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fr', builtin.lsp_references, {})
vim.keymap.set('n', 'ft', builtin.treesitter, {})
