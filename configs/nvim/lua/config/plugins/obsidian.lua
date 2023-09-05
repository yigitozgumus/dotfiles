return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Documents/Notes/Personal/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Notes/Personal/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  mappings = {},
  opts = {
    dir = "~/Documents/Notes/Personal", -- no need to call 'vim.fn.expand' here
  },
}
