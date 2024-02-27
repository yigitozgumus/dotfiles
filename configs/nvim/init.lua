-- Personal Neovim Configuration

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "catppuccin", "gruvbox-material" } },
  checker = { enabled = true, notify = false },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "nvim-treesitter-textobjects",
      },
    },
  },
  debug = false,
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

---------------------
--- Base Configuration
---------------------

local options = {

  -- Output Encoding that is shown on the terminal
  encoding = "utf-8",

  -- Output Encoding of that file that is written
  fileencoding = "utf-8",

  -- allow mouse to be used in neovim
  mouse = "a",

  -- creates a swapfile
  swapfile = false,

  -- time towait for a mapped sequence to complete
  timeoutlen = 1000,

  -- enable persistent undo
  undofile = true,
  title = true,

  -- highlight all matches on previous search pattern
  hlsearch = true,

  -- Creates a backup file
  backup = false,

  showcmd = true,

  -- more space in the neovim command line
  cmdheight = 1,

  -- Set global statusline
  laststatus = 2,

  number = true,

  showmatch = true,

  relativenumber = true,

  -- force all vertical splits to go to the right
  splitright = true,

  -- force all horizontal splits to go below current
  splitbelow = true,

  -- ignore case in search patterns
  ignorecase = true,

  -- Smart case
  smartcase = true,

  linebreak = true,

  nrformats = "",

  -- No need to see mode
  showmode = false,

  -- always show tabs
  showtabline = 2,

  -- Used for cmp
  completeopt = { "menuone", "noselect" },

  -- Backticks are visible in markdown
  conceallevel = 0,

  inccommand = "split",

  backupskip = { "/tmp/*", "/private/tmp/*" },

  backspace = { "start", "eol", "indent" },

  -- if a file is being edited by another program
  writebackup = false,

  -- convert tabs to spaces
  expandtab = true,

  -- the number of spaces inserted for each indentation
  shiftwidth = 4,

  -- insert 2 spaces for a tab
  tabstop = 4,

  -- make indenting smarter
  smartindent = true,

  autoindent = true,

  wrap = true,

  -- Enable background buffers
  hidden = true,

  -- Remember N lines in history
  history = 10000,

  -- Max column for syntax highlight
  synmaxcol = 240,

  -- ms to wait for trigger an event
  updatetime = 400,

  -- highlight the current line
  cursorline = true,

  termguicolors = true,

  winblend = 0,

  wildoptions = "pum",

  pumblend = 5,

  -- pop up menu height
  pumheight = 10,

  background = "dark",

  -- always show the sign column, otherwise it would shift the text each time
  signcolumn = "yes",

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
vim.opt.guifont = { "FiraCode Nerd Font", ":h20" }

---------------------
--- Keymaps ---
---------------------

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Clear search highlighting
keymap("n", "<leader>k", ":nohlsearch<CR>", default_opts)

keymap("n", "<leader>Q", ":bufdo bdelete<CR>", default_opts)

-- Reselect visual selection after indenting
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>", default_opts)
keymap("i", ",,", "<Esc>A,<Esc>", default_opts)

-- Open the current file in the default program (on Mac I think this is just `open`)
keymap("n", "<leader>xo", ":!open %<cr><cr>", default_opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", default_opts)
keymap("n", "<A-Down>", ":resize -2<CR>", default_opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", default_opts)

-- Disable arrow keys
keymap("i", "<up>", "<nop>", default_opts)
keymap("i", "<down>", "<nop>", default_opts)
keymap("i", "<left>", "<nop>", default_opts)
keymap("i", "<right>", "<nop>", default_opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", default_opts)
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)

keymap("n", "j", "gj", default_opts)
keymap("n", "k", "gk", default_opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", default_opts)
keymap("v", "<A-k>", ":m .-2<CR>==", default_opts)
keymap("v", "p", '"_dP', default_opts)

-- Change split orientation
keymap("n", "<leader>tk", "<C-w>t<C-w>K", default_opts) -- change vertical to horizontal
keymap("n", "<leader>th", "<C-w>t<C-w>H", default_opts) -- change horizontal to vertical
keymap("n", "<leader>se", "<C-w>=", default_opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", default_opts) -- close current split window

-- Tab Management
keymap("n", "<leader>to", ":tabnew<CR>", default_opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", default_opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", default_opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", default_opts) --  go to previous tab

-- Move around splits using Ctrl + {h,j,k,l}
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

-- Fast saving with <leader> and s
keymap("n", "<leader>s", ":w<CR>", default_opts)

keymap("", "<C-e>", "3<C-e>", default_opts)
keymap("", "<C-y>", "3<C-y>", default_opts)

-- Windows
keymap("n", "ss", ":split<Return><C-w>w", default_opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", default_opts)

-- Resize window
keymap("", "<C-w><left>", "<C-w><", default_opts)
keymap("", "<C-w><right>", "<C-w>>", default_opts)
keymap("", "<C-w><up>", "<C-w>+", default_opts)
keymap("", "<C-w><down>", "<C-w>-", default_opts)

-- Move for half page
keymap("n", "<C-u>", "<C-u>zz", default_opts)
keymap("n", "<C-d>", "<C-d>zz", default_opts)
keymap("n", "n", "nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)

-- restart lsp server
keymap("n", "<leader>rs", ":LspRestart<CR>", default_opts) -- mapping to restart lsp if necessary

vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

---------------------
--- Autocommands ---
---------------------

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  pattern = "*",
  command = "set nocursorline",
  group = cursorGrp,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = [[:checktime]] })

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  command = [[call mkdir(expand('<afile>:p:h'), 'p')]],
})

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "vim",
    "OverseerList",
    "OverseerForm",
    "fugitive",
    "toggleterm",
    "floggraph",
    "git",
    "neotest-summary",
    "query",
    "tsplayground",
    "neotest-output",
    "spectre_panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Use internal formatting for bindings like gq.
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.md",
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})
