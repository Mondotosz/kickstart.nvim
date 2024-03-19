return {
    'Civitasv/cmake-tools.nvim',
    dependencies = { 'akinsho/toggleterm.nvim', 'stevearc/overseer.nvim' },
    config = function()
      local cmake = require 'cmake-tools'
      cmake.setup {
        cmake_executor = {
          name = 'toggleterm',
          opts = {},
          default_opts = {
            toggleterm = {
              direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
              close_on_exit = true, -- whether close the terminal when exit
              auto_scroll = true, -- whether auto scroll to the bottom
            },
          },
        },
      }
    end,
  }
