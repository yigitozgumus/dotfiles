---------------------
--- Keymaps ---
---------------------

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

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
