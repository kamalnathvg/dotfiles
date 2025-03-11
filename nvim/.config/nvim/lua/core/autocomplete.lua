local cmp = require('cmp')

cmp.setup({
  -- Define completion sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_treesitter' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },

  -- Set up key mappings for autocompletion
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = false }),
  }),

  -- Define window configuration
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered({
      border = 'rounded',
      winhighlight = 'Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
    }),
  },

  -- Snippet support
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- Enable LSP signature help
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },

  -- Enable auto-triggering of documentation
  experimental = {
    ghost_text = true,
  },
})

-- Set up LSP handlers for hover popups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})

-- Define LSP config
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Define common on_attach function
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, bufopts) -- Updated
end

-- Define capabilities with nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configure all LSP servers
local servers = { 'gopls', 'pylsp'}

require('lspconfig').ts_ls.setup({
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
    on_attach = on_attach,
    capabilities = capabilities
})


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Configure pylsp separately with additional settings
-- lspconfig.pylsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = { 'W391' },
--           maxLineLength = 100,
--         },
--         --pylint = { enabled = true },
--         flake8 = { enabled = true },
--       },
--     },
--   },
-- })
-- 
