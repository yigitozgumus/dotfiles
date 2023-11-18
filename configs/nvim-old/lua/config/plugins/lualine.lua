local function clock()
  return " " .. os.date("%H:%M")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    if vim.g.started_by_firenvim then
      return
    end

    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy" } },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" } } },
        lualine_b = { "branch" },
        lualine_c = {
          { "diagnostics", sources = { "nvim_diagnostic" } },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          {
            function()
              local navic = require("nvim-navic")
              local ret = navic.get_location()
              return ret:len() > 2000 and "navic error" or ret
            end,
            cond = function()
              if package.loaded["nvim-navic"] then
                local navic = require("nvim-navic")
                return navic.is_available()
              end
            end,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_x = {
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              if package.loaded["noice"] then
                return require("noice").api.status.command.has()
              end
            end,
            color = { fg = "#ff9e64" },
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              if package.loaded["noice"] then
                return require("noice").api.status.mode.has()
              end
            end,
            color = { fg = "#ff9e64" },
          },
          {
            function()
              return require("noice").api.status.search.get()
            end,
            cond = function()
              if package.loaded["noice"] then
                return require("noice").api.status.search.has()
              end
            end,
            color = { fg = "#ff9e64" },
          },
          {
            function()
              return require("lazy.status").updates()
            end,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = { "location" },
        lualine_z = { { clock, separator = { right = "" } } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree" },
    })
  end,
}
