local pluginActive = true
if (not pluginActive) then return end

local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end
nvimtree.setup {
  git = {
    ignore = false,
  },
  view = {
    adaptive_size = true,
    side = "right",
    mappings = {
      list = {
      { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_opened_files = 'icon',
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
}

vim.cmd [[highlight NvimTreeIndentMarker guifg=#30323E]]

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
