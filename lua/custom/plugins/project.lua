return {
  'ahmedkhalf/project.nvim',
  opts = {
    manual_mode = true,
  },
  dependencies = { 'nvim-telescope/telescope.nvim' },
  event = 'VimEnter',
  config = function(_, opts)
    require('project_nvim').setup(opts)
    require('telescope').load_extension 'projects'
  end,
  keys = {
    { '<leader>sp', '<Cmd>Telescope projects<CR>', desc = '[S]earch [P]rojects' },
    { '<leader>pa', '<Cmd>ProjectRoot<CR>', desc = '[P]rojects [A]dd' },
  },
}
