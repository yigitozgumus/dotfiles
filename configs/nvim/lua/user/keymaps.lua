-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>er", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

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

-- -- Easy insertion of a trailing ; or , from insert mode
-- keymap("i", ";;", "<Esc>A;<Esc>", default_opts)
-- keymap("i", ",,", "<Esc>A,<Esc>", default_opts)

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

-- Neotree
keymap("n", "<leader>e", ":Neotree toggle<CR>", default_opts)

vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })
