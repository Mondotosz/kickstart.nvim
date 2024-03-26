return {
  'Civitasv/cmake-tools.nvim',
  ft = { 'c', 'cmake', 'cpp' },
  keys = {
    { '<leader>cc', ':CMakeBuild<cr>', desc = 'Cmake build' },
    { '<leader>cr', ':CMakeQuickRun<cr>', desc = 'Cmake run' },
    { '<leader>ct', ':CMakeSelectBuildTarget<cr>', desc = 'Cmake select build target' },
    { '<leader>cT', ':CMakeSelectBuildType<cr>', desc = 'Cmake select build type' },
    {
      '<leader>cq',
      function()
        local qf_exists = false
        for _, win in pairs(vim.fn.getwininfo()) do
          if win['quickfix'] == 1 then
            qf_exists = true
          end
        end
        if qf_exists == true then
          vim.cmd 'cclose'
          return
        end
        if not vim.tbl_isempty(vim.fn.getqflist()) then
          vim.cmd 'copen'
        end
      end,
      desc = 'Toggle quickfix window',
    },
  },
  dependencies = { 'akinsho/toggleterm.nvim', 'stevearc/overseer.nvim' },
  config = function()
    local cmake = require 'cmake-tools'
    cmake.setup {
      cmake_build_directory = 'build/${variant:buildType}',
      cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
      cmake_compile_commands_from_lsp = false,
      cmake_dap_configuration = { -- debug settings for cmake
        name = 'cpp',
        type = 'codelldb',
        request = 'launch',
        stopOnEntry = false,
        runInTerminal = true,
        console = 'integratedTerminal',
      },
      cmake_executor = {
        name = 'quickfix',
        opts = {},
        default_opts = {
          quickfix = {
            show = 'only_on_error', -- "always", "only_on_error"
            position = 'belowright', -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
            size = 10,
            encoding = 'utf-8', -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
            auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
          },
          toggleterm = {
            direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = false, -- whether close the terminal when exit
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
