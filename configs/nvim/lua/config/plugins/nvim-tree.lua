local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>n", ":NvimTreeToggle<CR>", desc = "NvimTree" },
  },
  cond = true,
  enabled = true,
  config = function()
    require("nvim-tree").setup({
      disable_netrw = false,
      hijack_netrw = true,
      respect_buf_cwd = true,
      view = {
        side = "left",
        adaptive_size = true,
        number = true,
        relativenumber = true,
      },
      filters = {
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
      actions = {
        open_file = {
          resize_window = true,
        },
      },
    })
  end,
}

return M
