vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.o.mouse = 'a'
vim.opt.clipboard:append { 'unnamedplus' }
vim.o.swapfile = false

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus=2            -- Set global statusline

vim.wo.number = true
vim.o.showmatch = true
vim.o.relativenumber = true

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.linebreak = true

vim.opt.inccommand = 'split'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- finding files Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------

vim.o.hidden = true           -- Enable background buffers
vim.o.history = 10000           -- Remember N lines in history
vim.o.lazyredraw = true       -- Faster scrolling
vim.o.synmaxcol = 240         -- Max column for syntax highlight
vim.o.updatetime = 700        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Misc
-----------------------------------------------------------
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.o.signcolumn = 'yes:2'
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.confirm = true
vim.o.fillchars = 'eob: '

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }


