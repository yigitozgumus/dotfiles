local keymap = vim.keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap.set("n", "<leader>k", ":nohlsearch<CR>")
keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")

-- Allow gf to open non-existent files
keymap.set("", "gf", ":edit <cfile><CR>")

-- Reselect visual selection after indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set("v", "y", "myy`hay")
keymap.set("v", "Y", "myY`y")

-- Easy insertion of a trailing ; or , from insert mode
keymap.set("i", ";;", "<Esc>A;<Esc>")
keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Open the current file in the default program (on Mac I think this is just `open`)
keymap.set("n", "<leader>x", ":!open %<cr><cr>")

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize +2<CR>")
keymap.set("n", "<C-Down>", ":resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Disable arrow keys
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")
keymap.set("i", "<up>", "<nop>")
keymap.set("i", "<down>", "<nop>")
keymap.set("i", "<left>", "<nop>")
keymap.set("i", "<right>", "<nop>")

keymap.set("", "j", "gj")
keymap.set("", "k", "gk")

-- Map Esc to ksh
keymap.set("i", "kk", "<Esc>")

-- Map jj to exiting insert mode
keymap.set("i", "jj", "<Esc>")

-- Clear search highlighting with <leader> and c
keymap.set("n", "<leader>c", ":nohl<CR>")

-- Change split orientation
keymap.set("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
keymap.set("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
keymap.set("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
keymap.set("n", "<leader>s", ":w<CR>")
keymap.set("i", "<leader>s", "<C-c>:w<CR>")

-- Close all windows and exit from Neovim with <leader> and q
keymap.set("n", "<leader>q", ":qa!<CR>")

keymap.set("i", "<F1>", "<ESC>")
keymap.set("n", "<F1>", "<ESC>")
keymap.set("v", "<F1>", "<ESC>")

keymap.set("", "<C-e>", "3<C-e>")
keymap.set("", "<C-y>", "3<C-y>")

-- Open current directory
keymap.set("", "te", ":tabedit<cr>")

-- Windows

keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- keymap.set("", "<Space>", "/")

-- Resize window
keymap.set("", "<C-w><left>", "<C-w><")
keymap.set("", "<C-w><right>", "<C-w>>")
keymap.set("", "<C-w><up>", "<C-w>+")
keymap.set("", "<C-w><down>", "<C-w>-")

--- Searching and Moving
-- keymap('n', '/', '/\v')
-- keymap('v', '/', '/\v')
keymap.set("", "<leader><space>", ":noh<cr>")

--- Close the current buffer
keymap.set("", "<leader>bd", ":Bclose<cr>:tabclose<cr>gT")

-- Close all buffers
keymap.set("", "<leader>ba", ":bufdo bd<cr>")

-- Show all buffers
keymap.set("", "<leader>bb", ":ls<cr>:buffer<Space>")

-- Move between buffers
keymap.set("", "“", ":bprev<cr>")
keymap.set("", "‘", ":bnext<cr>")

-- Move between tabs
keymap.set("n", "<C-S-Tab>", ":tabprev<cr>")
keymap.set("n", "<C-Tab>", ":tabnext<cr>")
keymap.set("n", "<leader>tn", ":tabnew<cr>")

-- Move between two files
keymap.set("n", "<leader><Space>", "<C-^>")

-- Markdown preview
keymap.set("n", "<leader>md", ":MarkdownPreview<cr>")

-- Move for half page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
