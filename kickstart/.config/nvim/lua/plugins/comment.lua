-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  opts = {},

  config = function()
    local ft = require 'Comment.ft'
    ft.templ = { '<!-- %s -->', '<!-- %s -->' }

    require('Comment').setup()
  end,
}
