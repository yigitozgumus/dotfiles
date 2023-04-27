local M = {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  cond = false,
  enabled = false,
}

function M.config()
  local scrollbar = require("scrollbar")

  local colors = require("tokyonight.colors").setup()
  scrollbar.setup({
    handle = {
      color = colors.bg_highlight,
    },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "notify",
    },
    marks = {
      Search = { color = colors.orange },
      Error = { color = colors.error },
      Warn = { color = colors.warning },
      Info = { color = colors.info },
      Hint = { color = colors.hint },
      Misc = { color = colors.purple },
    },
  })
end

return M
