--vim.cmd Q q
--vim.cmd Qa qa
--vim.cmd QA qa
--vim.cmd W w
--vim.cmd Wa wa
--vim.cmd WA wa
--vim.cmd WQA wqa
--vim.cmd Wqa wqa
--vim.cmd('WQa wqa')

local keymap = vim.keymap.set
keymap('n', '<F3>', ':set hlsearch!<cr>', { noremap = true})
keymap('n', '<leader>J', ':%!python -m json.tool<cr>', {})
