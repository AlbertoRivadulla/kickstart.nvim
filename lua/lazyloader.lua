-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  -- Detect shiftwidth automatically
  require 'plugins.guess-indent',

  -- Add a scroll bar with highlights for errors and git changes
  require 'plugins.scrollbar',

  -- Better display of search results
  require 'plugins.nvim-hlslens',

  -- Support for git
  require 'plugins.gitsigns',

  -- Useful plugin to show you pending keybinds.
  require 'plugins.which-key',

  -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.telescope',

  -- Configure the Lua LSP for the Neovim config
  require 'plugins.lazydev',

  -- Main LSP Configuration
  require 'plugins.nvim-lspconfig',

  -- -- Autoformat
  -- require 'plugins.conform',

  -- Autocompletion
  require 'plugins.blink-cmp',

  -- Different colorschemes
  require 'plugins.colorscheme',

  -- Highlight todo, notes, etc in comments
  require 'plugins.todo-comments',

  -- Collection of various small independent plugins/modules
  require 'plugins.mini',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',

  -- Show the context (namespace, function signature, ...) for the current cursor position at the top
  require 'plugins.nvim-treesitter-context',

  -- require 'plugins.debug',
  -- require 'plugins.indent_line',
  -- require 'plugins.lint',
  require 'plugins.autopairs',
  -- require 'plugins.neo-tree',

  -- File tree
  require 'plugins.nvim-tree',

  -- Zettelkasten/wiki
  require 'plugins.telekasten',

  -- Better markdown rendering
  require 'plugins.render-markdown',

  -- Fast switching between buffers
  require 'plugins.harpoon'
})
