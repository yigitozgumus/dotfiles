local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>n", ":NvimTreeToggle<CR>", desc = "NvimTree" },
  },
  cond = false,
  enabled = false,
  config = function()
    require("nvim-tree").setup({
      disable_netrw = false,
      hijack_netrw = true,
      respect_buf_cwd = true,
      view = {
        side = "right",
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
    })
  end,
}

return M