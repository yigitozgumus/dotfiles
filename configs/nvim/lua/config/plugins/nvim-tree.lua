local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", desc = "NvimTree" },
  },
  cond = false,
  enabled = false,
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
      respect_buf_cwd = true,
      view = {
        side = "left",
        adaptive_size = true,
        number = true,
        relativenumber = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      filters = {
        dotfiles = true,
        custom = { ".git" },
      },
      git = {
        enable = false,
      },
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })
  end,
}

return M
