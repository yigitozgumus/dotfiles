local cmdline = true

local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    { "hrsh7th/cmp-cmdline", enabled = cmdline },
    { "dmitmel/cmp-cmdline-history", enabled = cmdline },
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
}

function M.config()
  vim.opt.completeopt = "menuone,noselect"
  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  -- Setup nvim-cmp.
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = {
      { name = "nvim_lsp", max_item_count = 15 },
      { name = "nvim_lsp_signature_help", max_item_count = 5 },
      { name = "luasnip", max_item_count = 5 },
      { name = "treesitter", max_item_count = 5 },
      { name = "rg", max_item_count = 2 },
      { name = "buffer", max_item_count = 5 },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "crates" },
    },
    preselect = cmp.PreselectMode.None,
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
      },
    },
    formatting = {
      format = require("config.plugins.lsp.kind").cmp_format(),
    },
    experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    },
  })
end

return M
