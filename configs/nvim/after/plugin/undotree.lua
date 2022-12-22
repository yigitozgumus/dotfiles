local pluginActive = true
if (not pluginActive) then return end

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
