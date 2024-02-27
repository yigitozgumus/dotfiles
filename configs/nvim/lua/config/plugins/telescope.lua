return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-project.nvim" },
    { "cljoly/telescope-repo.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" },
    { "<leader>fp", ":Telescope git_files<CR>", desc = "Project files" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>sh", ":Telescope help_tags<CR>", desc = "Help Tags" },
    { "<leader>sw", ":Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>sg", ":Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
    { "<leader>sd", ":Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
  },
  config = function()
    -- Custom actions
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local telescope = require("telescope")
    local trouble = require("trouble.providers.telescope")
    local borderless = true
    telescope.setup({
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
      },
      defaults = {
        pickers = {
          find_files = {
            theme = "ivy",
            previewer = false,
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          },
          git_files = {
            theme = "dropdown",
            previewer = false,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
        layout_config = {
          prompt_position = "bottom",
          vertical = { width = 0.5 },
        },
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        history = {
          path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
          limit = 100,
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<c-t>"] = trouble.open_with_trouble,
            -- ["<c-z>"] = trouble.open_with_trouble,
            ["?"] = actions_layout.toggle_preview,
          },
          n = {
            ["<c-t>"] = trouble.open_with_trouble,
          },
        },
        prompt_prefix = " ",
        selection_caret = " ",
        winblend = borderless and 0 or 10,
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("project") -- telescope-project.nvim
    telescope.load_extension("repo")
    telescope.load_extension("file_browser")
  end,
}
