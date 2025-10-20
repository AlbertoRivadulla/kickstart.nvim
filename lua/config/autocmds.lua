-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--- Open Nvim-tree at startup
local function open_nvim_tree()
  --- Open the three out of focus, and with the current file highlighted
  require('nvim-tree.api').tree.toggle { focus = false, find_file = true }
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

--- Close Nvim-tree when the buffers have all been closed
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('NvimTreeClose', { clear = true }),
  pattern = 'NvimTree_*',
  callback = function()
    local layout = vim.api.nvim_call_function('winlayout', {})
    if layout[1] == 'leaf' and
      vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), 'filetype') == 'NvimTree' and
      layout[3] == nil then
      vim.cmd 'confirm quit'
    end
  end,
})

--- Highlight different to-do list elements
-- Define highlight groups
vim.api.nvim_set_hl(0, "TodoUnchecked", { fg = "#000000", bg = "#999999", bold = true })
vim.api.nvim_set_hl(0, "TodoDone", { fg = "#AAAAAA", bg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "TodoInProgress", { fg = "#000000", bg = "#777777", bold = true })
vim.api.nvim_set_hl(0, "TodoUncertain", { fg = "#000000", bg = "#f2ac33", bold = true })
vim.api.nvim_set_hl(0, "TodoWarning", { fg = "#000000", bg = "#CC4444", bold = true })
-- Match the patterns
vim.fn.matchadd("TodoUnchecked", "\\[\\s\\]")
vim.fn.matchadd("TodoDone", "\\[x\\]")
vim.fn.matchadd("TodoInProgress", "\\[/\\]")
vim.fn.matchadd("TodoUncertain", "\\[?\\]")
vim.fn.matchadd("TodoWarning", "\\[!\\]")

-- Disable inserting comments automatically when adding a new line below/above a comment
--  'r' -> pressing 'Enter' in insert mode
--  'o' -> pressing 'O' in normal mode
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "o" })
    -- vim.opt.formatoptions:remove({ "r", "o" })
  end
})

-- --- Automatically continue bullet point lists in Markdown files
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function()
-- 		vim.opt_local.formatoptions:append("r") -- `<CR>` in insert mode
-- 		vim.opt_local.formatoptions:append("o") -- `o` in normal mode
-- 		vim.opt_local.comments = {
-- 			"b:- [ ]",
-- 			"b:- [x]",
-- 			"b:*", -- unordered list
-- 			"b:-",
-- 			"b:+",
-- 		}
-- 	end,
-- })
