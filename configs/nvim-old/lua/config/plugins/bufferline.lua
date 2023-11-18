return {
	"akinsho/nvim-bufferline.lua",
	event = "BufAdd",
	cond = true,
	enabled = true,
	config = function()
		local signs = require("config.plugins.lsp.diagnostics").signs

		signs = {
			error = signs.Error,
			warning = signs.Warn,
			info = signs.Info,
			hint = signs.Hint,
		}

		local severities = {
			"error",
			"warning",
			"info",
			"hint",
		}
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				separator_style = "thick",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics_indicator = function(_, _, diag)
					local s = {}
					for _, severity in ipairs(severities) do
						if diag[severity] then
							table.insert(s, signs[severity] .. diag[severity])
						end
					end
					return table.concat(s, " ")
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo Tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
}
