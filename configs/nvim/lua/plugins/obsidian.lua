return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
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
    notes_subdir = "_inbox",
    new_notes_location = "notes_subdir",
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    daily_notes = {
      folder = "Journal/Daily",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      prepend_note_id = false,
    },
    open_app_foreground = true,
    open_notes_in = "vsplit",
  },
}
