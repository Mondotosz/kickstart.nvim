return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  event = 'BufWinEnter',
  opts = {},
  version = '^1.0.0',
  keys = {
    { ']b', ':BufferNext<CR>', desc = 'Next Buffer' },
    { '[b', ':BufferPrevious<CR>', desc = 'Previous Buffer' },
    { '<leader>q', ':BufferClose<CR>', desc = '[Q]uit buffer' },
    { '<leader>Q', ':BufferCloseAllButCurrent<CR>', desc = '[Q]uit buffer' },
  },
  enabled = false,
}
