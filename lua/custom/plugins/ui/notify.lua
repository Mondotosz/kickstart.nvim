return {
  'rcarriga/nvim-notify',
  event = 'VimEnter',
  keys = {
    { '<leader>sN', '<cmd>Telescope notify<cr>', desc = '[S]earch [N]otifications' },
  },
  config = function()
    vim.notify = require 'notify'
  end,
}
