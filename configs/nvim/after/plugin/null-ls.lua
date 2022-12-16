local buf_keymap = require 'lib.utils'.buf_keymap
local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier
  },
  on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_keymap(bufnr, "n", "gd", ":LspDef<CR>")
    buf_keymap(bufnr, "n", "gr", ":LspRename<CR>")
    buf_keymap(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_keymap(bufnr, "n", "K", ":LspHover<CR>")
    buf_keymap(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_keymap(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_keymap(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_keymap(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_keymap(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    if client.server_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
}
