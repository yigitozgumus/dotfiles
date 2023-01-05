local M = {}

local icons = require("config.icons")

function M.install_plugin()
    return {
        "rcarriga/nvim-notify",
        event = "BufReadPre",
        config = function()
            M.setup()
        end,
        disable = false,
    }
end

function M.setup()
	local notify = require("notify")
	notify.setup({
		icons = {
			ERROR = icons.diagnostics.Error,
			WARN = icons.diagnostics.Warning,
			INFO = icons.diagnostics.Information,
			DEBUG = icons.ui.Bug,
			TRACE = icons.ui.Pencil,
		},
	})
	vim.notify = notify
end

return M
