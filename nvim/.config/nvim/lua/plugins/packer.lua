-- Ensure Packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Define the ColorMyPencils function
  function ColorMyPencils(color)
    color = color or "rose-pine"  -- Default to rose-pine if no color is provided
      vim.cmd.colorscheme(color)
    end

    local packer_bootstrap = ensure_packer()

    -- Use Packer to manage plugins
    require('packer').startup(function(use)
      -- Packer can manage itself
      use 'wbthomason/packer.nvim'

      -- Plugins here
      use 'neovim/nvim-lspconfig'
      use 'plasticboy/vim-markdown'
      use 'hrsh7th/nvim-cmp'
      use 'hrsh7th/cmp-nvim-lsp'
      use 'hrsh7th/cmp-buffer'
      use 'hrsh7th/cmp-path'
      use 'saadparwaiz1/cmp_luasnip'
      use 'L3MON4D3/LuaSnip'
      use 'nvim-lua/plenary.nvim'
      use 'sheerun/vim-polyglot'
      use 'BurntSushi/ripgrep'
      use 'sharkdp/fd'
      use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { 
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
        }
      }

    -- Install Mason and Mason-LSPconfig with Packer
      use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        run = ":MasonUpdate"  -- Automatically update Mason when starting Neovim
      }

        use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
      }

      use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
      }

      use {
        "folke/tokyonight.nvim",
        config = function()
          -- Configure tokyonight colorscheme
          require("tokyonight").setup({
              style = "night",
              transparent = true,
              terminal_colors = true,
              styles = {
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = "dark",
                floats = "dark",
              },
            })
          -- Apply tokyonight colorscheme
          ColorMyPencils("tokyonight")
        end,
      }
      --  use {
        --        "rose-pine/neovim",
        --        name = "rose-pine",
        --        config = function()
          --          -- Configure rose-pine colorscheme
          --          require("rose-pine").setup({ 
              --              variant = "main",
              --              disable_background = true,
              --              styles = {
                --                  italic = false
              --              },
            --          })
          --          -- Apply rose-pine colorscheme
          --          ColorMyPencils("rose-pine")
        --    end,
      --  }


    end)

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
      require('packer').sync()
    end

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {"pylsp"}
})

