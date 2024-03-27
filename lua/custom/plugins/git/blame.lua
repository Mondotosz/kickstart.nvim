return {
  'FabijanZulj/blame.nvim',
  keys = {
    {'<leader>gb', ':ToggleBlame virtual<cr>', desc = "[G]it [B]lame toggle"},
  },
  config = function ()
    require('blame').setup {
      merge_consecutive = true,
    }
  end
}
