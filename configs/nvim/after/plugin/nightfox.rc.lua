local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup({
  options = {
    transparent = true,
  }
})

vim.cmd("colorscheme duskfox")
