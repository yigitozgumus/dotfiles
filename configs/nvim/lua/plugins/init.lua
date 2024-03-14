return {

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-spectre" },
  { "segeljakt/vim-silicon" },
  { "mfussenegger/nvim-dap" },
  { "elihunter173/dirbuf.nvim", cmd = { "Dirbuf" } },
  { "folke/zen-mode.nvim" },
  {
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
    cond = true,
    enabled = true,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
  },

  {
    "doums/suit.nvim",
    config = function()
      require("suit").setup({})
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "BufReadPre",
    config = function()
      require("dressing").setup({
        input = { relative = "editor" },
        select = { backend = { "telescope", "fzf", "builtin" } },
      })
    end,
  },
  -- IDE
  {
    "max397574/better-escape.nvim",
    event = { "InsertEnter" },
    config = function()
      require("better_escape").setup({
        mapping = { "jk" },
        timeout = vim.o.timeoutlen,
        keys = "<ESC>",
      })
    end,
  },

  -- Better Comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup({})
    end,
  },
  -- Theme: icons
  {
    "nvim-tree/nvim-web-devicons",
    opts = { default = true },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
    cond = true,
    enabled = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "danymat/neogen",
    cond = false,
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    cond = false,
    enabled = false,
    opts = {
      excluded_argnames = {
        usages = {
          lua = { "self", "use" },
        },
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do

  { -- Autoformat
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require("mini.statusline")
      statusline.setup()

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we disable the section for
      -- cursor information because line numbers are already enabled
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return ""
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
