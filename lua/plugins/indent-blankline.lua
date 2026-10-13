return {
  {
    'lukas-reineke/indent-blankline.nvim',
    --- @module "ibl"
    --- @type ibl.config
    main = 'ibl',
    indent = { char = "|", smart_indent_cap = true },
    opts = {
      scope = { enabled = true },
    },
  },
}
