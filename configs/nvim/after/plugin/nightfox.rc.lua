local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup({
  options = {
    transparent = false,
  }
})

-- vim.cmd("colorscheme duskfox")
