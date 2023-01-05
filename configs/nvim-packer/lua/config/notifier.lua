local M = {}

function M.install_plugin()
	return {

		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup({})
		end,
		disable = true,
	}
end

return M
