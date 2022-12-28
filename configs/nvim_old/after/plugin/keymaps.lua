local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("n", "<leader>k", ":nohlsearch<CR>")
keymap("n", "<leader>Q", ":bufdo bdelete<CR>")

-- Allow gf to open non-existent files
keymap("", "gf", ":edit <cfile><CR>")

-- Reselect visual selection after indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`hay")
keymap("v", "Y", "myY`y")

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>")
keymap("i", ",,", "<Esc>A,<Esc>")

-- Open the current file in the default program (on Mac I think this is just `open`)
keymap("n", "<leader>x", ":!open %<cr><cr>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Disable arrow keys
keymap("", "<up>", "<nop>")
keymap("", "<down>", "<nop>")
keymap("", "<left>", "<nop>")
keymap("", "<right>", "<nop>")
keymap("i", "<up>", "<nop>")
keymap("i", "<down>", "<nop>")
keymap("i", "<left>", "<nop>")
keymap("i", "<right>", "<nop>")

keymap("", "j", "gj")
keymap("", "k", "gk")

-- Map Esc to ksh
keymap("i", "kk", "<Esc>")

-- Map jj to exiting insert mode
keymap("i", "jj", "<Esc>")

-- Clear search highlighting with <leader> and c
keymap("n", "<leader>c", ":nohl<CR>")

-- Change split orientation
keymap("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
keymap("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
keymap("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
keymap("n", "<leader>s", ":w<CR>")
keymap("i", "<leader>s", "<C-c>:w<CR>")

-- Close all windows and exit from Neovim with <leader> and q
keymap("n", "<leader>q", ":qa!<CR>")

keymap("i", "<F1>", "<ESC>")
keymap("n", "<F1>", "<ESC>")
keymap("v", "<F1>", "<ESC>")

keymap("", "<C-e>", "3<C-e>")
keymap("", "<C-y>", "3<C-y>")

-- Open current directory
keymap("", "te", ":tabedit<cr>")

-- Windows

keymap("n", "ss", ":split<Return><C-w>w")
keymap("n", "sv", ":vsplit<Return><C-w>w")

-- keymap.set("", "<Space>", "/")

-- Resize window
keymap("", "<C-w><left>", "<C-w><")
keymap("", "<C-w><right>", "<C-w>>")
keymap("", "<C-w><up>", "<C-w>+")
keymap("", "<C-w><down>", "<C-w>-")

--- Searching and Moving
-- keymap('n', '/', '/\v')
-- keymap('v', '/', '/\v')
keymap("", "<leader><space>", ":noh<cr>")

--- Close the current buffer
keymap("", "<leader>bd", ":Bclose<cr>:tabclose<cr>gT")

-- Close all buffers
keymap("", "<leader>ba", ":bufdo bd<cr>")

-- Show all buffers
keymap("", "<leader>bb", ":ls<cr>:buffer<Space>")

-- Move between buffers
keymap("", "“", ":bprev<cr>")
keymap("", "‘", ":bnext<cr>")

-- Move between tabs
keymap("n", "<C-S-Tab>", ":tabprev<cr>")
keymap("n", "<C-Tab>", ":tabnext<cr>")
keymap("n", "<leader>tn", ":tabnew<cr>")

-- Move between two files
keymap("n", "<leader><Space>", "<C-^>")

-- Markdown preview
keymap("n", "<leader>md", ":MarkdownPreview<cr>")

-- Move for half page
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

-- Browser search
keymap("n", "gx", "<Plug>(openbrowser-smart-search)", default_opts)
keymap("x", "gx", "<Plug>(openbrowser-smart-search)", default_opts)

-- windows.nvim
-- keymap("n", "<C-w>z", "<Cmd>WindowsMaximize<CR>", default_opts)

-- focus.nvim
keymap("n", "<C-w>z", "<Cmd>FocusMaxOrEqual<CR>", default_opts)

keymap("n", "<leader>gg", "<cmd>lua require('config.toggleterm').lazygit_toggle()<CR>", default_opts)
keymap("n", "<leader>tt", "<cmd>lua require('config.toggleterm').floatingterm_toggle()<CR>", default_opts)
