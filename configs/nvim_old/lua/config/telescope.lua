local M = {}

-- Custom actions
local transform_mod = require("telescope.actions.mt").transform_mod
local nvb_actions = transform_mod({
	file_path = function(prompt_bufnr)
		-- Get selected entry and the file full path
		local content = require("telescope.actions.state").get_selected_entry()
		local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

		-- Yank the path to unnamed and clipboard registers
		vim.fn.setreg('"', full_path)
		vim.fn.setreg("+", full_path)

		-- Close the popup
		require("utils").info("File path is yanked ")
		require("telescope.actions").close(prompt_bufnr)
	end,

	-- VisiData
	visidata = function(prompt_bufnr)
		-- Get the full path
		local content = require("telescope.actions.state").get_selected_entry()
		local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

		-- Close the Telescope window
		require("telescope.actions").close(prompt_bufnr)

		-- Open the file with VisiData
		local term = require("utils.term")
		term.open_term("vd " .. full_path, { direction = "float" })
	end,
})

-- trouble.nvim
local trouble = require("trouble.providers.telescope")
local icons = require("config.icons")

function M.setup()
	local actions = require("telescope.actions")
	local actions_layout = require("telescope.actions.layout")
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			layout_config = {
				prompt_position = "top",
				vertical = { width = 0.5 },
			},
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			selection_caret = " ",
			-- path_display = { "smart" },
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["<c-z>"] = trouble.open_with_trouble,
					["?"] = actions_layout.toggle_preview,
				},
			},
			history = {
				path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
				limit = 100,
			},
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				mappings = {
					n = {
						["y"] = nvb_actions.file_path,
						["s"] = nvb_actions.visidata,
					},
					i = {
						["<C-y>"] = nvb_actions.file_path,
						["<C-s>"] = nvb_actions.visidata,
					},
				},
				hidden = true,
				find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			},
			git_files = {
				theme = "dropdown",
				previewer = false,
				mappings = {
					n = {
						["y"] = nvb_actions.file_path,
						["s"] = nvb_actions.visidata,
					},
					i = {
						["<C-y>"] = nvb_actions.file_path,
						["<C-s>"] = nvb_actions.visidata,
					},
				},
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
				mappings = {
					n = {
						["y"] = nvb_actions.file_path,
						["s"] = nvb_actions.visidata,
					},
					i = {
						["<C-y>"] = nvb_actions.file_path,
						["<C-s>"] = nvb_actions.visidata,
					},
				},
			},
		},
		extensions = {
			arecibo = {
				["selected_engine"] = "google",
				["url_open_command"] = "xdg-open",
				["show_http_headers"] = false,
				["show_domain_icons"] = false,
			},
			media_files = {
				filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "mp4", "webm" },
				find_cmd = "fd",
			},
			bookmarks = {
				selected_browser = "brave",
				url_open_command = nil,
				url_open_plugin = "open_browser",
				full_path = true,
				firefox_profile_name = nil,
			},
			project = {
				hidden_files = false,
				theme = "dropdown",
			},
			file_browser = {
				theme = "dropdown",
				hijack_netrw = true,
			},
		},
	})

	require("neoclip").setup() -- https://github.com/AckslD/nvim-neoclip.lua/issues/5

	telescope.load_extension("fzf")
	telescope.load_extension("project") -- telescope-project.nvim
	telescope.load_extension("repo")
	telescope.load_extension("file_browser")

	-- Telescope
	vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
end

return M
