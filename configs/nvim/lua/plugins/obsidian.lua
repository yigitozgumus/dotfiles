return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Go to Today's Note", mode = "n" },
    { "<leader>fl", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link under cursor", mode = "n" },
    -- { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
  },
  mappings = {
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "$HOME/Documents/Notes/Personal",
      },
    },
    disable_frontmatter = true,
    notes_subdir = "+",
    new_notes_location = "notes_subdir",
    templates = {
      subdir = "x/templates",
      date_format = "%Y-%m-%d",
      time_format = "%H::%S",
    },
    daily_notes = {
      folder = "Calendar Notes/daily",
      date_format = "%m-%d",
      template = "Daily Template.md",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      prepend_note_id = false,
    },
    open_app_foreground = true,
    open_notes_in = "current",
  },
}
