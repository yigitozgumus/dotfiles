local function terminal_lazygit()
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
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
end

local function terminal()
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
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
end
local function toggle_lazygit()
  terminal_lazygit():toggle()
end

local function toggle_terminal()
  terminal():toggle()
end

return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>gg", toggle_lazygit, desc = "Lazygit" },
    { "<leader>tt", toggle_terminal, desc = "Terminal" },
  },
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup()
  end,
}
