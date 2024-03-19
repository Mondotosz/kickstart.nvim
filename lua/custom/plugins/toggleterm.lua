return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'float',
    },
    config = function()
      local term = require 'toggleterm'
      term.setup {}

      -- toggle main term
      vim.keymap.set({ 'v', 'i', 't' }, '¬', function()
        term.toggle_command 'direction=float'
      end, { desc = 'ToggleTerm: Open terminal' })

      -- select term
      vim.keymap.set('n', '<leader>ts', ':TermSelect<cr>', { desc = 'ToggleTerm: Select terminal' })

      -- numbered term
      for i = 1, 9 do
        vim.keymap.set('n', '<leader>t' .. i, ':ToggleTerm ' .. i .. ' direction=float name=' .. i .. '<cr>', { desc = 'ToggleTerm: Show terminal ' .. i })
      end

      -- toggle main term in normal mode
      --  WARN: Must be the last keymap in this call
      vim.keymap.set('n', '¬', ':ToggleTerm direction=float<cr>', { desc = 'ToggleTerm: Toggle terminal' })
    end,
  }
