local M = {
  "simrat39/rust-tools.nvim",
  -- cond = false,
  -- enabled = false,
}

function M.setup(options)
  local opts = {
    tools = { -- rust-tools options
      inlay_hints = {
        show_parameter_hints = true,
        parameter_hints_prefix = "  <-  ",
        other_hints_prefix = "  =>  ",
        highlight = "LspCodeLens",
      },
    },
    server = options, -- rust-analyer options
  }

  require("rust-tools").setup(opts)
end

return M
