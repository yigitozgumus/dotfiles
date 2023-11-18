local mini = {
  "echasnovski/mini.nvim",
}

local specs = { mini, "JoosepAlviste/nvim-ts-context-commentstring" }

function mini.jump()
  require("mini.jump").setup({})
end

function mini.pairs()
  require("mini.pairs").setup({})
end

function mini.comment()
  require("mini.comment").setup({
    hooks = {
      pre = function()
        require("ts_context_commentstring.internal").update_commentstring({})
      end,
    },
  })
end

function mini.config()
  mini.pairs()
  mini.comment()
end

function mini.init()
  vim.keymap.set("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
  end)
  vim.keymap.set("n", "<leader>bD", function()
    require("mini.bufremove").delete(0, true)
  end)
end

return specs
