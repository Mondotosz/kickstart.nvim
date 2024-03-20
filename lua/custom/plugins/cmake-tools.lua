return {
  'Civitasv/cmake-tools.nvim',
  ft = { 'c', 'cmake' },
  keys = {
    {"<leader>cc", ":CMakeBuild<cr>", desc = "Cmake build"},
    {"<leader>cr", ":CMakeRun<cr>", desc = "Cmake run"},
    {"<leader>ct", ":CMakeSelectBuildTarget<cr>", desc = "Cmake select build target"},
    {"<leader>cT", ":CMakeSelectBuildType<cr>", desc = "Cmake select build type"},
  },
  dependencies = { 'akinsho/toggleterm.nvim', 'stevearc/overseer.nvim' },
  config = function()
    local cmake = require 'cmake-tools'
    cmake.setup {
      cmake_build_directory = 'build/${variant:buildType}',
      cmake_soft_link_compile_commands = false, -- this will automatically make a soft link from compile commands file to project root dir
      cmake_compile_commands_from_lsp = true,
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
      cmake_runner = {
        name = 'toggleterm',
        opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = { -- a list of default and possible values for runners
          toggleterm = {
            direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = false, -- whether close the terminal when exit
            auto_scroll = true, -- whether auto scroll to the bottom
          },
        },
      },
    }
  end,
}
