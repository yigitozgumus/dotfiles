return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  requires = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = {
        width = 40,
        adaptive_size = true,
      },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
    })
  end,
}
