

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.signcolumn = 'yes:2'
vim.o.relativenumber = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.spell = true
vim.o.title = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = false
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
vim.o.mouse = 'a'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
vim.o.confirm = true
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.updatetime = 250          -- Decrease CursorHold delay
vim.o.redrawtime = 10000        -- Allow more time for loading syntax on large files
vim.o.showmode = false
vim.o.fillchars = 'eob: '


-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
vim.opt.shortmess:append "sI"

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