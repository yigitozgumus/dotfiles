return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  cond = false,
  enabled = false,
  config = function()
    require("obsidian").setup({
      dir = "~/Documents/2-Areas/notes/Notes-Collection",
      use_advanced_uri = true,
      completion = {
        nvim_cmp = true,
      },
    })
  end,
}
