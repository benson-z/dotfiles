vim.g.mapleader = " "

-- go back a file
vim.keymap.set('n', '<leader>[', '<C-^>')

-- Go to netrw
vim.keymap.set('n', '<leader>-', ':Ex<CR>', { noremap = true })
