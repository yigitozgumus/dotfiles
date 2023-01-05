local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

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
keymap("n", "<C-Up>", ":resize +2<CR>", default_opts)
keymap("n", "<C-Down>", ":resize -2<CR>", default_opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", default_opts)

-- Disable arrow keys
keymap("n", "<up>", "<nop>", default_opts)
keymap("n", "<down>", "<nop>", default_opts)
keymap("n", "<left>", "<nop>", default_opts)
keymap("n", "<right>", "<nop>", default_opts)
keymap("i", "<up>", "<nop>", default_opts)
keymap("i", "<down>", "<nop>", default_opts)
keymap("i", "<left>", "<nop>", default_opts)
keymap("i", "<right>", "<nop>", default_opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", default_opts)
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)

-- Stay in indent mode
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

keymap("n", "j", "gj", default_opts)
keymap("n", "k", "gk", default_opts)

-- Clear search highlighting with <leader> and c
keymap("n", "<leader>c", ":nohl<CR>", default_opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", default_opts)
keymap("v", "<A-k>", ":m .-2<CR>==", default_opts)
keymap("v", "p", '"_dP', default_opts)

-- Change split orientation
keymap("n", "<leader>tk", "<C-w>t<C-w>K", default_opts) -- change vertical to horizontal
keymap("n", "<leader>th", "<C-w>t<C-w>H", default_opts) -- change horizontal to vertical

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

-- Markdown preview
keymap("n", "<leader>md", ":MarkdownPreview<cr>", default_opts)

-- Move for half page
keymap("n", "<C-u>", "<C-u>zz", default_opts)
keymap("n", "<C-d>", "<C-d>zz", default_opts)
keymap("n", "n", "nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)
