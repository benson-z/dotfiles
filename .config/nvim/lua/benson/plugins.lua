return {

    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate"
    }, 

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }, 

    -- Pane navigation
    'christoomey/vim-tmux-navigator', 

    -- Comments
    'numToStr/Comment.nvim', 

    -- Auto pairing and surround text
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    'tpope/vim-surround', 

    -- Auto save
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {}
        end,
    }, 

    -- git diff
    'airblade/vim-gitgutter',

    -- Neovim theme
    'rebelot/kanagawa.nvim'

}
