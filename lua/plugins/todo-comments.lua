return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    config = function()
      require('todo-comments').setup({})
      vim.keymap.set('n', '<leader>tD', ':TodoLocList<CR>', { desc = 'Show all TODOs in the project' })
      vim.keymap.set("n", '<leader>td', function()
        local cur_filepath = vim.fn.expand('%:p')  -- full path of current file
        vim.cmd('TodoLocList cwd=' .. vim.fn.fnameescape(cur_filepath))
      end, { desc = 'Show all TODOs in the current file' })
    end
  }
}
