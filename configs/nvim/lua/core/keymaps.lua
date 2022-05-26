-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i','<right>', '<nop>')

map('', 'j', 'gj')
map('', 'k', 'gk')

-- Map Esc to ksh
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

map('i', '<F1>', '<ESC>')
map('n', '<F1>', '<ESC>')
map('v', '<F1>', '<ESC>')

map('',';',':')

map('', '<C-e>', '3<C-e>')
map('', '<C-y>', '3<C-y>')

-- Open current directory
map('', 'te',':tabedit')
map('','<S-Tab>', ':tabprev<Return>')
map('','<Tab>', ':tabnext<Return>')

-- Windows

map('', 'ss', ':split<Return><C-w>w')
map('', 'sv', ':vsplit<Return><C-w>w')

-- Move WIndow
map('','<Space>','<C-w>w')
map('','s<left>','<C-w>h')
map('','s<up>','<C-w>h')
map('','s<down>','<C-w>j')
map('','s<right>','<c-w>l')


-- Resize window
map('','<C-w><left>','<C-w><')
map('','<C-w><right>','<C-w>>')
map('','<C-w><up>','<C-w>+')
map('','<C-w><down>','<C-w>-')

-- Smart way to move between windows

map('','sh','<C-w>h')
map('','sk','<C-w>k')
map('','sj','<C-w>j')
map('','sl','<C-w>l')


-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
