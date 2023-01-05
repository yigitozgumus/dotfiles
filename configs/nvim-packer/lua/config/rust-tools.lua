-- import rust tools plugin safely
local status, rt = pcall(require, "rust-tools")
if not status then
	return
end

local ih = require("inlay-hints")

rt.setup({
    tools = {
        on_initialized = function()
        ih.set_all()
        end,
        inlay_hints = {
            auto = false,
        },
    },
	server = {
		on_attach = function(_, bufnr)
			require("config.lsp.lspconfig").onAttach(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})
