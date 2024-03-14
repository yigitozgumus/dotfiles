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
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
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
