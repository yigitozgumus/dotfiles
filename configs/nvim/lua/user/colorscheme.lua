
-- Colorscheme
-- Lua:
vim.o.background = "dark"
-- For light theme
-- jjvim.o.background = "light"
-- Enable transparent background
vim.g.vscode_transparent = 1
-- vim.g.tokyonight_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
-- Potential colorschemes: vscode onedark tokyonight duskfox
vim.cmd([[colorscheme tokyonight]])

-- Changing colorscheme based on the system theme
function _G.ChangeBackground()
  local result = vim.cmd(  'system("defaults read -g AppleInterfaceStyle") =~ "^Dark" ', true)
  if result then
    vim.o.background = "dark"
    vim.cmd ([[ colorscheme tokyonight ]])
  else
    vim.o.background = "light"
    vim.cmd ([[ colorscheme dayfox ]])
  end

end


 -- autocmd SigUSR1 * call ChangeBackground()

