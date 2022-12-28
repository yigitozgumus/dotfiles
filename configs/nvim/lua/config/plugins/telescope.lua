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
  },
  keys = {
    { "<leader>ff", project_files, desc = "Find File" },
    -- { "<leader>sh", ":Telescope help_tags<CR>", desc = "Help Tags" },
    -- { "<leader>sw", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
    -- { "<leader>sg", require("telescope.builtin").live_grep, desc = "[S]earch by [G]rep" },
    -- { "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
  },
  config = function()
    -- local actions = require("telescope.actions")

    local telescope = require("telescope")
    local borderless = true
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
        prompt_prefix = " ",
        selection_caret = " ",
        winblend = borderless and 0 or 10,
      },
    })
    telescope.load_extension("fzf")
  end,
}
