return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        actions = {
          open_file = {
            window_picker = {
              enable = false
            }
          }
        },
        filters = {
          dotfiles = false,
        },
        -- lazy = false,
        hijack_cursor = true,
        git = {
          enable = true,
          ignore = false
        },
        update_focused_file = {
          enable = true,
          update_root = false,
          -- update_cwd = true,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        renderer = {
          highlight_git = true,
          -- Icons to show in the tree
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = true,
              git = true,
              modified = true,
            },
            glyphs = {
              folder = {
                arrow_open = 'v',
                arrow_closed = '>',
              },
              modified = '+',
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        -- Show when a file has been modified
        modified = {
          enable = true,
        },
      }
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
    end,
  }
}
