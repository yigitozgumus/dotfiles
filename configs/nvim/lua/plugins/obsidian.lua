return {
  "epwalsh/obsidian.nvim",
  version = "*",
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
    dir = "~/Documents/Notes/Personal", -- no need to call 'vim.fn.expand' here,
    daily_notes = {
      folder = "/Daily",
    },
    new_notes_location = "Commonplace/",
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      prepend_note_id = false,
    },
    open_app_foreground = true,
    open_notes_in = "vsplit",
  },
}
