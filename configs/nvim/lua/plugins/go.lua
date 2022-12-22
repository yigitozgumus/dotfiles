local pluginActive = true
if (not pluginActive) then return end

local status, go = pcall(require, "go")
if (not status) then return end
go.setup()

local statusFormat, goformat = pcall(require, "go.format")
if (not statusFormat) then return end
goformat.goimport()

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
