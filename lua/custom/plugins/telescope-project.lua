return {
  'nvim-telescope/telescope-project.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  keys = {
    {
      '<leader>p',
      function()
        require('telescope').extensions.project.project { display_type = 'full' }
      end,
      desc = '[P]roject',
    },
  },
  config = function()
    require('telescope').load_extension 'project'
  end,
  enabled = false,
}
