require 'remaps'
require 'config'
require 'health'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plugins' },

    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    {
      'catppuccin/nvim',
      priority = 1000, -- Make sure to load this before all the other start plugins.
      config = function()
        require('catppuccin').setup {
          transparent_background = true,
        }
      end,
      init = function()
        -- Load the colorscheme here.
        vim.cmd.colorscheme 'catppuccin-frappe'

        -- You can configure highlights by doing something like:
        vim.cmd.hi 'Comment gui=none'
      end,
    },
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  change_detection = { notify = false },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
