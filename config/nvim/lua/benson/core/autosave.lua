-- Auto save on focus lost
local autosave_group = vim.api.nvim_create_augroup('autosave_buffer', { clear = true })

vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  callback = function()
    -- Iterate over all buffers and write them if they are modified
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_option(buf, 'modifiable') and vim.api.nvim_buf_get_option(buf, 'modified') then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd('silent! write')
        end)
      end
    end
  end,
  group = autosave_group,
})
