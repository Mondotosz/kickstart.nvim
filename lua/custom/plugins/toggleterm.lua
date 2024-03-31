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

    local toggle_n = function(n, symbol)
      return function()
        ensure_buffer_saved()
        term.toggle_command('direction=float name=' .. symbol, n)
      end
    end

    -- numbered term
    vim.keymap.set('n', '<leader>t1', toggle_n(1, '󰬺'), { desc = 'ToggleTerm: Show terminal 1' })
    vim.keymap.set('n', '<leader>t2', toggle_n(2, '󰬻'), { desc = 'ToggleTerm: Show terminal 2' })
    vim.keymap.set('n', '<leader>t3', toggle_n(3, '󰬼'), { desc = 'ToggleTerm: Show terminal 3' })
    vim.keymap.set('n', '<leader>t4', toggle_n(4, '󰬽'), { desc = 'ToggleTerm: Show terminal 4' })
    vim.keymap.set('n', '<leader>t5', toggle_n(5, '󰬾'), { desc = 'ToggleTerm: Show terminal 5' })
    vim.keymap.set('n', '<leader>t6', toggle_n(6, '󰬿'), { desc = 'ToggleTerm: Show terminal 6' })
    vim.keymap.set('n', '<leader>t7', toggle_n(7, '󰭀'), { desc = 'ToggleTerm: Show terminal 7' })
    vim.keymap.set('n', '<leader>t8', toggle_n(8, '󰭁'), { desc = 'ToggleTerm: Show terminal 8' })
    vim.keymap.set('n', '<leader>t9', toggle_n(9, '󰭂'), { desc = 'ToggleTerm: Show terminal 9' })

    vim.keymap.set({ 'v', 'i', 't', 'n' }, '¬', function()
      ensure_buffer_saved()
      term.toggle_command 'direction=float'
    end, { desc = 'ToggleTerm: Toggle terminal' })
    vim.keymap.set('n', '<leader>ts', '<cmd>TermSelect<cr>', { desc = 'ToggleTerm: Select terminal' })

    -- NOTE: Custom terminals
    local Terminal = require('toggleterm.terminal').Terminal

    -- NOTE: LazyGit terminal
    if vim.fn.executable 'lazygit' then
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float', display_name = 'LazyGit' }
      term.lazygit = lazygit

      vim.keymap.set('n', '<leader>gg', function()
        ensure_buffer_saved()
        lazygit:toggle()
      end, { desc = '[G]it Lazy[G]it' })

      vim.api.nvim_create_autocmd('DirChanged', {
        desc = 'Update the working directory for LazyGit',
        callback = function()
          lazygit.dir = vim.api.nvim_command 'pwd'
        end,
      })
    end
  end,
}
