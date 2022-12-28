vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = {
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the table
    window = {
      position = "right",
    },
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}
