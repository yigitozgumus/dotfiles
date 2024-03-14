vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  lazy = false,
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the table
    window = {
      position = "right",
    },
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}
