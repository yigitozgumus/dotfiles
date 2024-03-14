return {
  "smjonas/inc-rename.nvim",
  event = "BufEnter",
  config = function()
    require("inc_rename").setup({
      input_buffer_type = "dressing",
    })
  end,
}
