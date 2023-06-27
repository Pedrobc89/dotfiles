-- Backspace deletes like most programs in insert mode
vim.opt.backspace = 'indent,start,eol'
vim.opt.backup = false
vim.opt.writebackup = false
-- show the cursor position all the time
vim.opt.ruler = true
-- display incomplete commands
vim.opt.showcmd = true
-- do incremental searching
vim.opt.incsearch = true
-- Always display the status line
vim.opt.laststatus = 2  
-- Automatically :write before running commands
vim.opt.autowrite = true
-- Enable mouse to move windows
vim.opt.mouse = a       

--  Set timeout to keys
vim.opt.timeoutlen = 1000 ttimeoutlen=0

--  Relative Numbering
vim.opt.relativenumber = true
vim.opt.number = true

--  Hardtabs, 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set clipboard compatibility
vim.opt.clipboard = unnamed

-- Make it obvious where 80 characters is
vim.opt.textwidth = 100
vim.opt.wrapmargin = 0
vim.opt.colorcolumn = '100'
vim.opt.wrap = false

-- Smart case search, lowercase is insensitive and UPPERCASE is sensitive
-- Overridewith \c (insensitive) or \C (sensitive)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Status Line configs
vim.opt.laststatus = 2


-- Remove eob tilders
vim.opt.fillchars = vim.opt.fillchars + 'eob: '

-- Males "-" a part of the word
vim.opt.iskeyword:append("-")

vim.opt.termguicolors = true
--hi Visual  guifg=#000000 guibg=#FFFFFF gui=none

vim.opt.wildignore:append {
  '*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__'}

