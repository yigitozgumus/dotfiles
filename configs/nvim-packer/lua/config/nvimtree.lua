local M = {}

function M.setup()
	local nvim_tree = require("nvim-tree")
	nvim_tree.setup({
		disable_netrw = false,
		hijack_netrw = true,
		respect_buf_cwd = true,
		view = {
			side = "right",
			adaptive_size = true,
			number = true,
			relativenumber = true,
		},
		filters = {
			custom = { ".git" },
		},
		sync_root_with_cwd = true,
        actions = {
            open_file = {
                resize_window = true,
            },
        },
		update_focused_file = {
			enable = true,
			update_root = true,
		},
	})
end

return M