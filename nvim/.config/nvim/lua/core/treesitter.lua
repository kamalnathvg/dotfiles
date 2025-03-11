-- ~/.config/nvim/lua/core/treesitter.lua

require'nvim-treesitter.configs'.setup {
    ensure_installed ={ 'c','python', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'go' },   -- Install maintained parsers
    highlight = {
        enable = true,                  -- Enable highlighting
        disable = {},                   -- List of languages to disable
    },
    indent = {
        enable = true,                  -- Enable indentation
    },
}

