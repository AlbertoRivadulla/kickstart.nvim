-- disable netrw at the very start of your init.lua, needed for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use the Lua loader, to make startup faster
vim.loader.enable()

-- Set <space> as the leader key
-- see `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Reduce the LSP log level
--  Default "WARN"
--  It is possible to turn this off with "off"
vim.lsp.set_log_level("ERROR")

require 'config.options'

require 'config.keymaps'

require 'config.autocmds'

require 'lazyloader'
