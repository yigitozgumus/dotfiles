local M = {}

function M.setup()
	local telescope_setup, toggleterm = pcall(require, "toggleterm")
	if not telescope_setup then
		return
	end

	toggleterm.setup()
end

M.Terminal = require("toggleterm.terminal").Terminal
M.lazygit = M.Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("startinsert!")
	end,
})

M.FloatingTerm = M.Terminal:new({
	cmd = "zsh --login",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("startinsert!")
	end,
})

function M.floatingterm_toggle()
	M.FloatingTerm:toggle()
end

function M.lazygit_toggle()
	M.lazygit:toggle()
end

return M
