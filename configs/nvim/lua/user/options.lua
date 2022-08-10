
-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.o.swapfile = false
vim.o.completeopt = 'menuone,noinsert,noselect'


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.o.number = true
vim.o.showmatch = true
vim.o.foldmethod='indent'
vim.o.foldnestmax=10
vim.o.foldlevel=2
-- vim.o.colorcolumn = '80'      -- Line lenght marker at 80 columnsoption
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.linebreak = true
vim.o.relativenumber = true
vim.o.termguicolors = true    -- Enable 24-bit RGB colors
vim.o.laststatus=2            -- Set global statusline
vim.o.cmdheight = 1
vim.o.backup = false
vim.opt.backupskip = '/tmp/*./private/tmp/*'
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- finding files Search down into subfolders
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.autoindent = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------

vim.o.hidden = true           -- Enable background buffers
vim.o.history = 10000           -- Remember N lines in history
vim.o.lazyredraw = true       -- Faster scrolling
vim.o.synmaxcol = 240         -- Max column for syntax highlight
vim.o.updatetime = 700        -- ms to wait for trigger an event
-- vim.o.updatetime = 250          -- Decrease CursorHold delay
-- vim.o.redrawtime = 10000        -- Allow more time for loading syntax on large files

-----------------------------------------------------------
-- Misc
-----------------------------------------------------------
vim.o.signcolumn = 'yes:2'
vim.o.undofile = true
vim.o.title = true
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.confirm = true
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.showmode = false
vim.o.fillchars = 'eob: '
vim.cmd [[
setlocal path=.,**
set iskeyword+=-
]]


-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
