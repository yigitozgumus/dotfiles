vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  enabled = false,
  lazy = false,
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the table
    window = {
      position = "right",
      width = 50,
    },
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}
