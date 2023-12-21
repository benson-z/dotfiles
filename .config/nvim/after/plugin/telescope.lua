-- telescope config
require('telescope').setup {
    defaults = {
        -- themimg
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
        layout_config = {

            width = function(_, max_columns, _)
                return math.min(max_columns, 120)
            end,

            height = function(_, _, max_lines)
                return math.min(max_lines, 45)
            end,

            prompt_position = 'top', 
            vertical = {
                mirror = true, 
            },

        },
        path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            local win_width = vim.api.nvim_win_get_width(0) or 80
            local available_space = win_width - #tail - #path - 5 

            local padding = available_space > 0 and available_space or 0
            local aligned_path = string.rep(" ", padding) .. path

            return string.format("%s%s", tail, aligned_path)
        end,
        file_ignore_patterns = { 
            "node_modules", 
            "%.git/",
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}

-- Keybinds
local builtin = require('telescope.builtin')

-- find file by name
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
-- find in files
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
-- find help tags
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- find command
vim.keymap.set('n', '<leader>p', builtin.commands, {})
