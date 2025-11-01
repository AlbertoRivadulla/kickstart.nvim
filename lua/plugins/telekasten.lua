return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },

    config = function()
      local home = vim.fn.expand("$HOME/Documents/wiki")
      require('telekasten').setup({
        home = home,
        extension = ".md",
        new_note_filename = "title",
        date_format = "%Y-%m-%d",
        tag_notation = "#tag",
        command_palette_theme = 'popup',
        auto_set_filetype = false,

        -- Integrate with Telescope
        telescope = true,
      })

    local tk = require('telekasten')

    vim.keymap.set('n', '<leader>zf', tk.find_notes, { desc = "[Telekasten] Find notes" })
    vim.keymap.set('n', '<leader>zg', tk.search_notes, { desc = "[Telekasten] Grep in notes" })
    -- vim.keymap.set('n', '<leader>zd', tk.goto_today, { desc = "[Telekasten] Open today's note" })
    vim.keymap.set('n', '<leader>zz', tk.follow_link, { desc = "[Telekasten] Follow [[link]]" })
    vim.keymap.set('n', '<leader>zn', tk.new_note, { desc = "[Telekasten] Create new note" })
    vim.keymap.set('n', '<leader>zt', tk.show_tags, { desc = "[Telekasten] Show all tags" })
    vim.keymap.set('n', '<leader>zb', tk.show_backlinks, { desc = "[Telekasten] Show backlinks" })
    vim.keymap.set('n', '<leader>zp', tk.panel, { desc = "[Telekasten] Show panel" })

    -- -- Call insert link automatically when we start typing a link
    -- vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

    -- Enable some Telekasten keymaps ONLY inside the wiki directory
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = home .. "/*.md",
      callback = function()
        -- Optional: check the buffer path more strictly
        if not vim.fn.expand("%:p"):match(home) then return end

        -- Make the filetype markdown
        vim.bo.filetype = "markdown"

        -- Call insert link automatically when we start typing a link
        vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

        -- local opts = { buffer = true, noremap = true, silent = true }
        --
        -- -- Follow wiki links with [[...]] using Telekasten
        -- vim.keymap.set('n', 'gf', function()
        --   tk.follow_link()
        -- end, opts)
      end,
    })

    end,
  }
}
