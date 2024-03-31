return {
  'folke/trouble.nvim',
  branch = 'dev', -- IMPORTANT!
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble preview_float toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble preview_float toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp_float toggle<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle focus=true<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle focus=true<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
  opts = {
    modes = {
      preview_float = {
        mode = 'diagnostics',
        focus = true,
        preview = {
          type = 'float',
          relative = 'editor',
          border = 'rounded',
          title = 'Preview',
          title_pos = 'center',
          position = { 0, -2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
      cascade = {
        mode = 'preview_float', -- inherit from diagnostics mode
        filter = function(items)
          local severity = vim.diagnostic.severity.HINT
          for _, item in ipairs(items) do
            severity = math.min(severity, item.severity)
          end
          return vim.tbl_filter(function(item)
            return item.severity == severity
          end, items)
        end,
      },
      project = {
        mode = 'preview_float', -- inherit from diagnostics mode
        filter = {
          any = {
            buf = 0, -- current buffer
            {
              severity = vim.diagnostic.severity.ERROR, -- errors only
              -- limit to files in the current project
              function(item)
                return item.filename:find(vim.loop.cwd(), 1, true)
              end,
            },
          },
        },
      },
      lsp_float = {
        mode = 'lsp',
        focus = true,
        win = {
          position = 'right',
          size = 0.3,
        },
        preview = {
          type = 'float',
          relative = 'cursor',
          position = { 0, 0 },
          anchor = 'NE',
          border = 'rounded',
          title = 'Preview',
          title_pos = 'center',
          size = {
            width = 0.3,
            height = 0.3,
          },
          zindex = 200,
        },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
}
