---------------------
--- Base Configuration
---------------------

local options = {

	-- Output Encoding that is shown on the terminal
	encoding = "utf-8",

	-- Output Encoding of that file that is written
	fileencoding = "utf-8",

	-- allow mouse to be used in neovim
	mouse = "a",

	-- creates a swapfile
	swapfile = false,

	-- time towait for a mapped sequence to complete
	timeoutlen = 1000,

	-- enable persistent undo
	undofile = true,
	title = true,

	-- highlight all matches on previous search pattern
	hlsearch = true,

	-- Creates a backup file
	backup = false,

	showcmd = true,

	-- more space in the neovim command line
	cmdheight = 1,

	-- Set global statusline
	laststatus = 2,

	number = true,

	showmatch = true,

	relativenumber = true,

	-- force all vertical splits to go to the right
	splitright = true,

	-- force all horizontal splits to go below current
	splitbelow = true,

	-- ignore case in search patterns
	ignorecase = true,

	-- Smart case
	smartcase = true,

	linebreak = true,

	nrformats = "",

	-- No need to see mode
	showmode = false,

	-- always show tabs
	showtabline = 2,

	-- Used for cmp
	completeopt = { "menuone", "noselect" },

	-- Backticks are visible in markdown
	conceallevel = 0,

	inccommand = "split",

	backupskip = { "/tmp/*", "/private/tmp/*" },

	backspace = { "start", "eol", "indent" },

	-- if a file is being edited by another program
	writebackup = false,

	-- convert tabs to spaces
	expandtab = true,

	-- the number of spaces inserted for each indentation
	shiftwidth = 4,

	-- insert 2 spaces for a tab
	tabstop = 4,

	-- make indenting smarter
	smartindent = true,

	autoindent = true,

	wrap = true,

	-- Enable background buffers
	hidden = true,

	-- Remember N lines in history
	history = 10000,

	-- Max column for syntax highlight
	synmaxcol = 240,

	-- ms to wait for trigger an event
	updatetime = 400,

	-- highlight the current line
	cursorline = true,

	termguicolors = true,

	winblend = 0,

	wildoptions = "pum",

	pumblend = 5,

	-- pop up menu height
	pumheight = 10,

	background = "dark",

	-- always show the sign column, otherwise it would shift the text each time
	signcolumn = "yes",

	wildmode = "longest:full,full",

	scrolloff = 10,

	sidescrolloff = 10,

	colorcolumn = "80",

	confirm = true,

	fillchars = "eob: ",
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

-- allows neovim to access to system clipboard
vim.opt.clipboard:append({ "unnamedplus" })

-- finding files Search down into subfolders
vim.opt.path:append({ "**" })

vim.opt.wildignore:append({ "*/node_modules/*" })

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
