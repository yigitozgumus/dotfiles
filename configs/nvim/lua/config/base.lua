-- Base Configuration

-- Specify the character encoding in script
vim.scriptencoding = "utf-8"
-- Output Encoding that is shown on the terminal
vim.opt.encoding = "utf-8"
-- Output Encoding of that file that is written
vim.opt.fileencoding = "utf-8"

vim.o.mouse = "a"
vim.opt.clipboard:append({ "unnamedplus" })
vim.o.swapfile = false

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0

-- Set global statusline
vim.opt.laststatus = 2

vim.wo.number = true
vim.o.showmatch = true
vim.o.relativenumber = true

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.linebreak = true

vim.opt.inccommand = "split"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.backspace = { "start", "eol", "indent" }

-- finding files Search down into subfolders
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

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
-- Enable background buffers
vim.o.hidden = true
-- Remember N lines in history
vim.o.history = 10000
-- Max column for syntax highlight
vim.o.synmaxcol = 240
-- ms to wait for trigger an event
vim.o.updatetime = 700

-----------------------------------------------------------
-- Misc
-----------------------------------------------------------

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

vim.o.signcolumn = "yes:2"
vim.o.wildmode = "longest:full,full"
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.confirm = true
vim.o.fillchars = "eob: "

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
