return {
  "b0o/SchemaStore.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "MunifTanjim/nui.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-lua/plenary.nvim",
  "windwp/nvim-spectre",
  "folke/twilight.nvim",
  "folke/which-key.nvim",
  { "ellisonleao/gruvbox.nvim" },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
    cond = false,
    enabled = false,
  },
  -- Colorscheme
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  {
    "folke/tokyonight.nvim",
    config = function() end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
  },

  {
    "sainnhe/gruvbox-material",
    config = function()
      -- vim.cmd([[colorscheme gruvbox-material]])
    end,
    lazy = false,
  },
  -- Better surround
  { "tpope/vim-surround", event = "BufReadPre" },
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
  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- Better Comment
  {
    "numToStr/Comment.nvim",
    opt = true,
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup({})
    end,
    cond = false,
  },
  -- Theme: icons
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
    cond = false,
    enabled = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    cond = false,
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    config = {},
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
    config = { snippet_engine = "luasnip" },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md" },
    cmd = "MarkdownPreview",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    cond = false,
    enabled = false,
    config = {
      excluded_argnames = {
        usages = {
          lua = { "self", "use" },
        },
      },
    },
  },
}