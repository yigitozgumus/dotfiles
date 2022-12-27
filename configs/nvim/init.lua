-- Personal Neovim Configuration

vim.g.mapleader=","
vim.g.maplocalleader=","

require("config.lazy")
require("config.base")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.keymaps")
    require("config.autocommands")
  end
})


