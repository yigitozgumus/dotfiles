---------------------
--- Base Configuration
---------------------

local options = {
  encoding = "utf-8", -- Output Encoding that is shown on the terminal
  fileencoding = "utf-8", -- Output Encoding of that file that is written
  mouse = "a", -- allow mouse to be used in neovim
  swapfile = false, -- creates a swapfile
  timeoutlen = 1000, -- time towait for a mapped sequence to complete
  undofile = true, -- enable persistent undo
  title = true,
  hlsearch = true, -- highlight all matches on previous search pattern
  backup = false, -- Creates a backup file
  showcmd = true,
  cmdheight = 1, -- more space in the neovim command line
  laststatus = 2, -- Set global statusline
  number = true,
  showmatch = true,
  relativenumber = true,
  splitright = true, -- force all vertical splits to go to the right
  splitbelow = true, -- force all horizontal splits to go below current
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- Smart case
  linebreak = true,
  nrformats = "",
  showmode = false, -- No need to see mode
  showtabline = 2, -- always show tabs
  completeopt = { "menuone", "noselect" }, -- Used for cmp
  conceallevel = 0, -- Backticks are visible in markdown
  inccommand = "split",
  backupskip = { "/tmp/*", "/private/tmp/*" },
  backspace = { "start", "eol", "indent" },
  writebackup = false, -- if a file is being edited by another program
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  smartindent = true, -- make indenting smarter
  autoindent = true,
  wrap = true,
  hidden = true, -- Enable background buffers
  history = 10000, -- Remember N lines in history
  synmaxcol = 240, -- Max column for syntax highlight
  updatetime = 400, -- ms to wait for trigger an event
  cursorline = true, -- highlight the current line
  termguicolors = true,
  winblend = 0,
  wildoptions = "pum",
  pumblend = 5,
  pumheight = 10, -- pop up menu height
  background = "dark",
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wildmode = "longest:full,full",
  scrolloff = 10,
  sidescrolloff = 10,
  colorcolumn = "80",
  confirm = true,
  fillchars = "eob: ",
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- allows neovim to access to system clipboard
vim.opt.clipboard:append({ "unnamedplus" })

-- finding files Search down into subfolders
vim.opt.path:append({ "**" })

vim.opt.wildignore:append({ "*/node_modules/*" })

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
