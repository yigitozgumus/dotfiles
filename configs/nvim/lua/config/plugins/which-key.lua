return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    local whichkey = require("which-key")
    local conf = {
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
      },
    }
    local opts = {
      mode = "n", -- Normal mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
    }

    local v_opts = {
      mode = "v", -- Visual mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
    }
    local keymap = {
      ["w"] = { "<cmd>update!<CR>", "Save" },
      ["q"] = { "<cmd>lua require('util').quit()<CR>", "Quit" },
      p = {
        name = "Project",
        p = { "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>", "List" },
        s = { "<cmd>lua require'telescope'.extensions.repo.list{}<cr>", "Search" },
        P = { "<cmd>TermExec cmd='BROWSER=brave yarn dev'<cr>", "Slidev" },
      },
    }
    whichkey.register(keymap, opts)
    whichkey.setup(conf)
  end,
}
