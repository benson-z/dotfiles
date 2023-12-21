-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'} }
    }

    -- pane navigation
    use {
        'christoomey/vim-tmux-navigator',
    }

    -- nvim tree
    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional
    --     },
    -- }

    -- comment.nvim
    use {
        'numToStr/Comment.nvim',
    }

    -- Auto pairing and surround text
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'tpope/vim-surround',
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- git diff
    use {
        'airblade/vim-gitgutter',
    }

    -- Auto save
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })

    -- Theme
    use 'rebelot/kanagawa.nvim'

end)
