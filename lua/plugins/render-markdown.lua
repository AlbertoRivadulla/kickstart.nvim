return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },  -- only load for markdown files
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",  -- used internally for rendering
    },

    config = function()
      require("render-markdown").setup({
        enabled = true,
        conceal = false,
        -- heading = { enabled = true },
        bullet = { enabled = false },
        quote = { enabled = true },
        dash = { enabled = true },
        link = { enabled = false },
        -- checkbox = { enabled = true },
        pipe_table = { enabled = true },
        inline = { enabled = false },

        code = {
          -- Turn on / off code block & inline code rendering.
          enabled = true,
          -- Additional modes to render code blocks.
          render_modes = true,
          -- Turn on / off sign column related rendering.
          sign = true,
          -- Whether to conceal nodes at the top and bottom of code blocks.
          conceal_delimiters = true,
          -- Turn on / off language heading related rendering.
          language = true,
          -- Determines where language icon is rendered.
          -- | right | right side of code block |
          -- | left  | left side of code block  |
          position = 'left',
          -- Whether to include the language icon above code blocks.
          language_icon = true,
          -- Whether to include the language name above code blocks.
          language_name = true,
          -- Whether to include the language info above code blocks.
          language_info = true,
          -- Amount of padding to add around the language.
          -- If a float < 1 is provided it is treated as a percentage of available window space.
          language_pad = 0,
          -- A list of language names for which background highlighting will be disabled.
          -- Likely because that language has background highlights itself.
          -- Use a boolean to make behavior apply to all languages.
          -- Borders above & below blocks will continue to be rendered.
          disable_background = { 'diff' },
          -- Width of the code block background.
          -- | block | width of the code block  |
          -- | full  | full width of the window |
          width = 'full',
          -- Amount of margin to add to the left of code blocks.
          -- If a float < 1 is provided it is treated as a percentage of available window space.
          -- Margin available space is computed after accounting for padding.
          left_margin = 0,
          -- Amount of padding to add to the left of code blocks.
          -- If a float < 1 is provided it is treated as a percentage of available window space.
          left_pad = 0,
          -- Amount of padding to add to the right of code blocks when width is 'block'.
          -- If a float < 1 is provided it is treated as a percentage of available window space.
          right_pad = 0,
          -- Minimum width to use for code blocks when width is 'block'.
          min_width = 0,
          -- Determines how the top / bottom of code block are rendered.
          -- | none  | do not render a border                               |
          -- | thick | use the same highlight as the code body              |
          -- | thin  | when lines are empty overlay the above & below icons |
          -- | hide  | conceal lines unless language name or icon is added  |
          border = 'hide',
          -- Used above code blocks to fill remaining space around language.
          language_border = '█',
          -- Added to the left of language.
          language_left = '',
          -- Added to the right of language.
          language_right = '',
          -- Used above code blocks for thin border.
          above = '▄',
          -- Used below code blocks for thin border.
          below = '▀',
          -- Turn on / off inline code related rendering.
          inline = true,
          -- Icon to add to the left of inline code.
          inline_left = '',
          -- Icon to add to the right of inline code.
          inline_right = '',
          -- Padding to add to the left & right of inline code.
          inline_pad = 0,
          -- Highlight for code blocks.
          highlight = 'RenderMarkdownCode',
          -- Highlight for code info section, after the language.
          highlight_info = 'RenderMarkdownCodeInfo',
          -- Highlight for language, overrides icon provider value.
          highlight_language = nil,
          -- Highlight for border, use false to add no highlight.
          highlight_border = 'RenderMarkdownCodeBorder',
          -- Highlight for language, used if icon provider does not have a value.
          highlight_fallback = 'RenderMarkdownCodeFallback',
          -- Highlight for inline code.
          highlight_inline = 'RenderMarkdownCodeInline',
          -- Determines how code blocks & inline code are rendered.
          -- | none     | { enabled = false }                           |
          -- | normal   | { language = false }                          |
          -- | language | { disable_background = true, inline = false } |
          -- | full     | uses all default values                       |
          style = 'full',
        },

        heading = {
          -- Useful context to have when evaluating values.
          -- | level    | the number of '#' in the heading marker         |
          -- | sections | for each level how deeply nested the heading is |
          -- Turn on / off heading icon & background rendering.
          enabled = true,
          -- Additional modes to render headings.
          render_modes = false,
          -- Turn on / off atx heading rendering.
          atx = true,
          -- Turn on / off setext heading rendering.
          setext = true,
          -- Replaces '#+' of 'atx_h._marker'.
          -- Output is evaluated depending on the type.
          -- | function | `value(context)`              |
          -- | string[] | `cycle(value, context.level)` |
          -- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
          icons = {},
          -- Determines how icons fill the available space.
          -- | right   | '#'s are concealed and icon is appended to right side                      |
          -- | inline  | '#'s are concealed and icon is inlined on left side                        |
          -- | overlay | icon is left padded with spaces and inserted on left hiding additional '#' |
          position = 'overlay',
          -- Width of the heading background.
          -- | block | width of the heading text |
          -- | full  | full width of the window  |
          -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
          width = 'block',
          -- Amount of margin to add to the left of headings.
          -- Margin available space is computed after accounting for padding.
          -- If a float < 1 is provided it is treated as a percentage of available window space.
          -- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
          left_margin = 0,
          -- Amount of padding to add to the left of headings.
          -- Output is evaluated using the same logic as 'left_margin'.
          left_pad = 0,
          -- Amount of padding to add to the right of headings when width is 'block'.
          -- Output is evaluated using the same logic as 'left_margin'.
          right_pad = 0,
          -- Minimum width to use for headings when width is 'block'.
          -- Can also be a list of integers evaluated by `clamp(value, context.level)`.
          min_width = 0,
          -- -- Determines if a border is added above and below headings.
          -- -- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
          -- border = false,
          -- -- Always use virtual lines for heading borders instead of attempting to use empty lines.
          -- border_virtual = false,
          -- -- Highlight the start of the border using the foreground highlight.
          -- border_prefix = false,
          -- -- Used above heading for border.
          -- above = '▄',
          -- -- Used below heading for border.
          -- below = '▀',
          -- Highlight for the heading icon and extends through the entire line.
          -- Output is evaluated by `clamp(value, context.level)`.
          backgrounds = {
              'RenderMarkdownH1',
              'RenderMarkdownH2',
              'RenderMarkdownH3',
              'RenderMarkdownH4',
              'RenderMarkdownH5',
              'RenderMarkdownH6',
          },
          -- -- Highlight for the heading and sign icons.
          -- -- Output is evaluated using the same logic as 'backgrounds'.
          -- foregrounds = {
          --     'RenderMarkdownH1',
          --     'RenderMarkdownH2',
          --     'RenderMarkdownH3',
          --     'RenderMarkdownH4',
          --     'RenderMarkdownH5',
          --     'RenderMarkdownH6',
          -- },
          -- Define custom heading patterns which allow you to override various properties based on
          -- the contents of a heading.
          -- The key is for healthcheck and to allow users to change its values, value type below.
          -- | pattern    | matched against the heading text @see :h lua-patterns |
          -- | icon       | optional override for the icon                        |
          -- | background | optional override for the background                  |
          -- | foreground | optional override for the foreground                  |
          custom = {},
        },
        checkbox = {
          -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'.
          -- There are two special states for unchecked & checked defined in the markdown grammar.

          -- Turn on / off checkbox state rendering.
          enabled = true,
          -- Additional modes to render checkboxes.
          render_modes = false,
          -- Render the bullet point before the checkbox.
          bullet = true,
          -- Padding to add to the left of checkboxes.
          left_pad = 0,
          -- Padding to add to the right of checkboxes.
          right_pad = 1,
          unchecked = {
              -- Replaces '[ ]' of 'task_list_marker_unchecked'.
              icon = '󰄱 ',
              -- Highlight for the unchecked icon.
              highlight = 'RenderMarkdownTodo',
              -- Highlight for item associated with unchecked checkbox.
              scope_highlight = nil,
          },
          checked = {
              -- Replaces '[x]' of 'task_list_marker_checked'.
              icon = '󰱒 ',
              -- Highlight for the checked icon.
              highlight = 'RenderMarkdownChecked',
              -- Highlight for item associated with checked checkbox.
              scope_highlight = nil,
          },
          -- Define custom checkbox states, more involved, not part of the markdown grammar.
          -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks.
          -- The key is for healthcheck and to allow users to change its values, value type below.
          -- | raw             | matched against the raw text of a 'shortcut_link'           |
          -- | rendered        | replaces the 'raw' value when rendering                     |
          -- | highlight       | highlight for the 'rendered' icon                           |
          -- | scope_highlight | optional highlight for item associated with custom checkbox |
          -- stylua: ignore
          custom = {
              slash = { raw = '[/]', rendered = '[/]', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
              question = { raw = '[?]', rendered = '[?]', highlight = 'TodoUncertain', scope_highlight = nil },
              warn = { raw = '[!]', rendered = '[!]', highlight = 'TodoWarning', scope_highlight = nil },
          }
        },
        html = {
          -- Turn on / off all HTML rendering.
          enabled = true,
          -- Additional modes to render HTML.
          render_modes = false,
          comment = {
              -- Turn on / off HTML comment concealing.
              conceal = false,
              -- Optional text to inline before the concealed comment.
              text = nil,
              -- Highlight for the inlined text.
              highlight = 'RenderMarkdownHtmlComment',
          },
          -- HTML tags whose start and end will be hidden and icon shown.
          -- The key is matched against the tag name, value type below.
          -- | icon            | optional icon inlined at start of tag           |
          -- | highlight       | optional highlight for the icon                 |
          -- | scope_highlight | optional highlight for item associated with tag |
          tag = {},
        },
      })

      -- Set different colors for each heading level
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#ff5555", bg = '#402626', bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#ff8844", bg = '#402626', bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#ffaa22", bg = '#402626', bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#55ff55", bg = '#402626', bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#55ffff", bg = '#402626', italic = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#5555ff", bg = '#402626', italic = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#5555ff", bg = '#402626', italic = true })
    end
  }
}
