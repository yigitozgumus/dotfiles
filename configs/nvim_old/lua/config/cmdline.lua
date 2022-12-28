local M = {}

function M.setup() 
    require('fine-cmdline').setup({
        hooks = {
            before_mount = function(input)
                input.input_props.prompt = ':'
            end
        }
    })
    vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
end

return M