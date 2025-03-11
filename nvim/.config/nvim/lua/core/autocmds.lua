-- ~/.config/nvim/lua/core/autocmds.lua

vim.cmd [[
  augroup MyAutoCommands
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup END
]]

