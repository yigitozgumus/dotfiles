return {
  {
    "folke/tokyonight.nvim",
    config = function()
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "martinsione/darkplus.nvim",
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({

        transparent_background = true,
        -- term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
