return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
  },
  config = function()
    local term = require 'toggleterm'
    term.setup {}

    local ensure_buffer_saved = function()
      local buf = vim.api.nvim_get_current_buf()

      if vim.api.nvim_get_option_value('modifiable', { buf = buf }) and vim.api.nvim_get_option_value('modified', { buf = buf }) then
        vim.api.nvim_command 'w'
      end
    end

    -- numbered term
    for i = 1, 9 do
      vim.keymap.set('n', '<leader>t' .. i, ':ToggleTerm ' .. i .. ' direction=float name=' .. i .. '<cr>', { desc = 'ToggleTerm: Show terminal ' .. i })
    end

    vim.keymap.set({ 'v', 'i', 't', 'n' }, '¬', function()
      ensure_buffer_saved()
      term.toggle_command 'direction=float'
    end, { desc = 'ToggleTerm: Toggle terminal' })
    vim.keymap.set('n', '<leader>ts', ':TermSelect<cr>', { desc = 'ToggleTerm: Select terminal' })

    -- NOTE: Custom terminals
    local Terminal = require('toggleterm.terminal').Terminal

    -- NOTE: LazyGit terminal
    if vim.fn.executable 'lazygit' then
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

      vim.keymap.set('n', '<leader>gg', function()
        ensure_buffer_saved()
        lazygit:toggle()
      end, { desc = '[G]it Lazy[G]it' })
    end
  end,
}
