return {
  { "b0o/SchemaStore.nvim" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-spectre" },
  { "segeljakt/vim-silicon" },
  { "mfussenegger/nvim-dap" },
  { "elihunter173/dirbuf.nvim", cmd = { "Dirbuf" } },
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
    "iamcco/markdown-preview.nvim",
    event = { "InsertEnter" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
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
}
