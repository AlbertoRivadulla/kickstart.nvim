
# Configure and install plugins
 To check the current status of your plugins, run
   ```:Lazy```

# Loading plugins
Plugins can be configured to **run Lua code** when they are loaded. This is often very useful to both group configuration, 
as well as handle lazy loading plugins that don't need to be loaded immediately at startup.
For example, in the configuration for `folke/which-key.nvim` we use:
    ```event = 'VimEnter'```
which loads which-key before all the UI elements are loaded. Events can be normal autocommands events 
(`:help autocmd-events`). Then, because we use the `opts` key (recommended), the configuration runs after the plugin has 
been loaded as `require(MODULE).setup(opts)`.

Plugins can **specify dependencies**. The dependencies are proper plugin specifications as well - anything you do for a 
plugin at the top level, you can do for a dependency.
Use the `dependencies` key to specify the dependencies of a particular plugin

# Keyboard shortcuts

## General
- `:<line_nr>` go to the given line number
- `:vs` vertical split
## LSP
- Global defaults
    - `gra` selects a code action available at the cursor position
    - `grr` list the references of the current symbol
    - `gri` list the implementations of the current symbol
    - `grt` go to the definition of the type under the cursor
    - `gO` list all symbols in the current buffer
- Manage diagnostics
    - `<leader>di` display diagnostics inline (virtual text)
    - `<leader>de` display diagnostics in additional lines (virtual text)
- Defined commands
    - `<leader>rn` rename the variable under the cursor
    - `<leader>ca` go to code action
    - `<leader>ds` open document symbols
    - `<leader>ws` open workspace symbols
    - `<leader>th` toggle inline hints
    - `K` show documentation of the word under the cursor
    - `gr` go to reference
    - `gi` go to implementation
    - `gd` go to definition
    - `gD` go to declaration
    - `gT` go to type definition
    - `gf` open the link to a file
    - `gx` open a URL in the browser

## Telescope
- `<leader>sh` search help
- `<leader>sk` search keymaps
- `<leader>sf` search file names
- `<leader>sw` search the current word
- `<leader>sg` search by grep
- `<leader>sd` search diagnostics
- `<leader>sr` resume the last search
- `<leader>s.` search on the recent files
- `<leader><leader>` find an existing buffer
- `<leader>gd` live grep in the chosen directory
- `<leader>/` fuzzily search in the current buffer
- `<leader>s/` live grep in the open files

## Telekasten
- `<leader>zn` new note
- `<leader>zf` find notes by title
- `<leader>zg` grep in notes
- `<leader>zt` show tags
- `<leader>zz` follow link
- `<leader>zb` show backlinks to the current file
- `<leader>zp` open the Telekasten panel

## Gitsigns
- `<leader>hd` show the diff of the current buffer with the head
    - `:Gitsigns diffthis <revision>` show the diff with a given revision
- `<leader>hD` show the diff with the previous commit
- `<leader>tb` show blame info for the current line inline
- `<leader>hb` show blame info for the current line in a popup
- `<leader>tw` toggle word diff

## todo-comments
- `<leader>tD` show all notes in the project
- `<leader>td` show notes in the current file

## nvim-tree
- Reference [link](https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/)
- General
    - [!] algo
    - `R` refresh
    - `H` hide/display hidden files and folders
    - `W` collapse the entire tree
    - `-` go one directory up
    - `s` (system) open a file with the system application set by default for that file type
    - `f` (find) interactive file search
    - `Ctrl+k` display information about the file
- Opening files
    - `Enter`, `o` open the file in a new buffer move the cursor to it
    - `Tab` open the file in a new buffer and keep the cursor on the tree
    - `Ctrl+v` open the file in a new vertical split
- File management
    - `a` create files or folders. A folder is created by following the name with a `/`
    - `r` rename file
    - `Ctrl+r` rename file regardless of its original name
    - `d` delete file or folder
    - `x` cut
    - `c` copy
    - `p` paste
    - `y` copy only the file name to the clipboard
        - `Y` copy the relative path
        - `g+y` copy the absolute path

## treesitter-context
- `<leader>tc` toggle context

## blink.cmp
- `Ctrl+p` previous item
- `Ctrl+n` next item
- `Ctrl+y` select item

## Plugin management
- `:Lazy` plugin management menu
- `:Mason` package manager used for LSPs etc.


