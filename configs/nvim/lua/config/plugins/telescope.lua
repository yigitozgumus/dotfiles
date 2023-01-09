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
    local transform_mod = require("telescope.actions.mt").transform_mod
    local nvb_actions = transform_mod({
      file_path = function(prompt_bufnr)
        -- Get selected entry and the file full path
        local content = require("telescope.actions.state").get_selected_entry()
        local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

        -- Yank the path to unnamed and clipboard registers
        vim.fn.setreg('"', full_path)
        vim.fn.setreg("+", full_path)

        -- Close the popup
        require("utils").info("File path is yanked ")
        require("telescope.actions").close(prompt_bufnr)
      end,

      -- VisiData
      visidata = function(prompt_bufnr)
        -- Get the full path
        local content = require("telescope.actions.state").get_selected_entry()
        local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

        -- Close the Telescope window
        require("telescope.actions").close(prompt_bufnr)

        -- Open the file with VisiData
        local term = require("utils.term")
        term.open_term("vd " .. full_path, { direction = "float" })
      end,
    })
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local telescope = require("telescope")
    local trouble = require("trouble.providers.telescope")
    local borderless = true
    telescope.setup({
      defaults = {
        pickers = {
          find_files = {
            theme = "ivy",
            previewer = false,
            mappings = {
              n = {
                ["y"] = nvb_actions.file_path,
                ["s"] = nvb_actions.visidata,
              },
              i = {
                ["<C-y>"] = nvb_actions.file_path,
                ["<C-s>"] = nvb_actions.visidata,
              },
            },
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          },
          git_files = {
            theme = "dropdown",
            previewer = false,
            mappings = {
              n = {
                ["y"] = nvb_actions.file_path,
                ["s"] = nvb_actions.visidata,
              },
              i = {
                ["<C-y>"] = nvb_actions.file_path,
                ["<C-s>"] = nvb_actions.visidata,
              },
            },
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
            mappings = {
              n = {
                ["y"] = nvb_actions.file_path,
                ["s"] = nvb_actions.visidata,
              },
              i = {
                ["<C-y>"] = nvb_actions.file_path,
                ["<C-s>"] = nvb_actions.visidata,
              },
            },
          },
        },
        layout_config = {
          prompt_position = "top",
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
