return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
  },
  config = function()
    local term = require 'toggleterm'
    term.setup {}

    -- numbered term
    for i = 1, 9 do
      vim.keymap.set('n', '<leader>t' .. i, ':ToggleTerm ' .. i .. ' direction=float name=' .. i .. '<cr>', { desc = 'ToggleTerm: Show terminal ' .. i })
    end

    vim.keymap.set({ 'v', 'i', 't', 'n' }, '¬', function()
      term.toggle_command 'direction=float'
    end, { desc = 'ToggleTerm: Toggle terminal' })
    vim.keymap.set('n', '<leader>ts', ':TermSelect<cr>', { desc = 'ToggleTerm: Select terminal' })

    -- NOTE: Custom terminals
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

    vim.keymap.set('n', '<leader>gg', function()
      lazygit:toggle()
    end, { desc = '[G]it Lazy[G]it' })
  end,
}
