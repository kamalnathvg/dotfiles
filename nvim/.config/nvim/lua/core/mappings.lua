
-- Copy to clipboard
vim.api.nvim_set_keymap('v', '<leader>c', '"+y"<CR>', { noremap = true, silent =true })
vim.api.nvim_set_keymap('n', '<leader>c', '"+yy"<CR>', { noremap = true, silent =true })
vim.api.nvim_set_keymap('n', '<leader>C', ':%y+<CR>', { noremap = true, silent =true })

-- Map double quotes
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })

-- Map single quotes
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true, silent = true })

-- Map parentheses
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })

-- Map square brackets
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })

-- Map curly braces
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })

-- Map curly braces with newlines
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', { noremap = true, silent = true })

-- Map curly braces with semicolon and newlines
vim.api.nvim_set_keymap('i', '{;<CR>', '{<CR>};<ESC>O', { noremap = true, silent = true })

-- Clear highlighted text 
vim.api.nvim_set_keymap('n', 'gx', ':noh<CR>', { noremap = true, silent =true })
