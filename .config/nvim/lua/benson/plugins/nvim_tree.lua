return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    enabled = false,
    config = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 35,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                git_ignored = false,
                dotfiles = true,
            },
        })

        -- keymaps
        local api = require("nvim-tree.api")

        vim.keymap.set("n", "<leader>s", api.tree.toggle, {})
    end
}
