-- Toggle a bunch of settings for normal text files
-- Define the global variable wrapenabled
vim.g.wrapenabled = 0

-- Define the Lua function to toggle wrap
local function toggle_wrap()
  vim.o.wrap = true
  vim.o.list = false
  if vim.g.wrapenabled == 1 then
    vim.o.linebreak = false
    vim.api.nvim_del_keymap('n', 'j')
    vim.api.nvim_del_keymap('n', 'k')
    vim.api.nvim_del_keymap('n', '0')
    vim.api.nvim_del_keymap('n', '^')
    vim.api.nvim_del_keymap('n', '$')
    vim.api.nvim_del_keymap('v', 'j')
    vim.api.nvim_del_keymap('v', 'k')
    vim.api.nvim_del_keymap('v', '0')
    vim.api.nvim_del_keymap('v', '^')
    vim.api.nvim_del_keymap('v', '$')
    vim.g.wrapenabled = 0
  else
    vim.o.linebreak = true
    local opts = { noremap = true }
    vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
    vim.api.nvim_set_keymap('n', 'k', 'gk', opts)
    vim.api.nvim_set_keymap('n', '0', 'g0', opts)
    vim.api.nvim_set_keymap('n', '^', 'g^', opts)
    vim.api.nvim_set_keymap('n', '$', 'g$', opts)
    vim.api.nvim_set_keymap('v', 'j', 'gj', opts)
    vim.api.nvim_set_keymap('v', 'k', 'gk', opts)
    vim.api.nvim_set_keymap('v', '0', 'g0', opts)
    vim.api.nvim_set_keymap('v', '^', 'g^', opts)
    vim.api.nvim_set_keymap('v', '$', 'g$', opts)
    vim.g.wrapenabled = 1
  end
end

-- Assign the Lua function to a global variable so it can be called from a command
_G.toggle_wrap = toggle_wrap

-- Create a command called "ToggleWrap" that calls the Lua function
vim.api.nvim_create_user_command('ToggleWrap', toggle_wrap, {})
