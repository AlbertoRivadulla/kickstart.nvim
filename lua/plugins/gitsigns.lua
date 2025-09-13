-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.
--
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    config = function()
      -- require('gitsigns').setup()
      require('gitsigns').setup {
        sign_priority=100,
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', '<leader>hb', function()
            gitsigns.blame_line { full = true }
          end, { desc = 'Show blame in a popup' })

          map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff with HEAD' })

          map('n', '<leader>hD', function()
            gitsigns.diffthis '~'
          end, { desc = 'Diff with the previous commit' })
          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Show blame inline' })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })
          vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {fg = "#AAAAAA"})
        end,
      }
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
}
