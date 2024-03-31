return {
  'akinsho/bufferline.nvim',
  version = '*',
  keys = {
    { ']b', ':BufferLineCycleNext<CR>', desc = 'Next Buffer' },
    { '[b', ':BufferLineCyclePrev<CR>', desc = 'Previous Buffer' },
    {
      '<leader>q',
      function()
        local buf = vim.api.nvim_get_current_buf()

        if vim.api.nvim_get_option_value('modifiable', { buf = buf }) and vim.api.nvim_get_option_value('modified', { buf = buf }) then
          vim.api.nvim_command 'w'
        end
        require('bufferline').unpin_and_close()
      end,
      desc = '[Q]uit buffer',
    },
    { '<leader>Q', ':BufferLineCloseOthers<CR>', desc = '[Q]uit buffer' },
  },
  event = 'BufWinEnter',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
    },
  },
}
