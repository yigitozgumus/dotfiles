return {
  "simrat39/inlay-hints.nvim",
  config = function()
    require("inlay-hints").setup({})
  end,
  event = "BufEnter",
  cond = true,
  enabled = true,
}

-- return {
--   "lvimuser/lsp-inlayhints.nvim",
--   config = function()
--     require("lsp-inlayhints").setup({
--       parameter_hints = {
--         show = true,
--         prefix = "<- ",
--         separator = ", ",
--       },
--       type_hints = {
--         -- type and other hints
--         show = true,
--         prefix = "",
--         separator = ", ",
--         remove_colon_end = false,
--         remove_colon_start = false,
--       },
--       -- separator between types and parameter hints. Note that type hints are
--       -- shown before parameter
--       labels_separator = "  ",
--       -- whether to align to the length of the longest line in the file
--       max_len_align = false,
--       -- padding from the left if max_len_align is true
--       max_len_align_padding = 1,
--       -- whether to align to the extreme right or not
--       right_align = false,
--       -- padding from the right if right_align is true
--       right_align_padding = 7,
--       -- highlight group
--       highlight = "Comment",
--     })
--   end,
-- }
