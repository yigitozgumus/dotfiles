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
      ["<C-l>"] = cmp.mapping({
        i = function(fallback)
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          else
            fallback()
          end
        end,
      }),
      ["<C-u>"] = cmp.mapping({
        i = function(fallback)
          if luasnip.choice_active() then
            require("luasnip.extras.select_choice")()
          else
            fallback()
          end
        end,
      }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete({}),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif neogen.jumpable() then
          neogen.jump_next()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif neogen.jumpable(true) then
          neogen.jump_prev()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<C-y>"] = {
        i = cmp.mapping.confirm({ select = false }),
      },
    }),
    sources = {
      { name = "nvim_lsp", max_item_count = 15 },
      { name = "nvim_lsp_signature_help", max_item_count = 5 },
      { name = "luasnip", max_item_count = 5 },
      -- { name = "cmp_tabnine" },
      { name = "treesitter", max_item_count = 5 },
      { name = "rg", max_item_count = 2 },
      { name = "buffer", max_item_count = 5 },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "crates" },
    },
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
  if cmdline then
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        -- { name = "noice_popupmenu" },
        { name = "path" },
        { name = "cmdline" },
        -- { name = "cmdline_history" },
      }),
    })
  end
end

return M
