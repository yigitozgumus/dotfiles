local function project_files()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-project.nvim" },
    -- { "nvim-telescope/telescope-repo.nvim" },
  },
  keys = {
    { "<leader>ff", project_files, desc = "Find File" },
    { "<leader>sh", ":Telescope help_tags<CR>", desc = "Help Tags" },
    { "<leader>sw", ":Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>sg", ":Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
    { "<leader>sd", ":Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
  },
  config = function()
    -- local actions = require("telescope.actions")

    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local telescope = require("telescope")
    local borderless = true
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
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
            -- ["<c-z>"] = trouble.open_with_trouble,
            ["?"] = actions_layout.toggle_preview,
          },
        },
        --  prompt_prefix = " ",
        --  selection_caret = " ",
        winblend = borderless and 0 or 10,
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("project") -- telescope-project.nvim
    -- telescope.load_extension("repo")
    -- telescope.load_extension("file_browser")
  end,
}
