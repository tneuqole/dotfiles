return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  -- references:
  -- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/harpoon.lua
  -- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/local.lua
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>aa', function()
      harpoon:list():add()
    end, { desc = 'Add' })
    vim.keymap.set('n', '<leader>am', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Quick Menu' })

    vim.keymap.set('n', '<leader>ap', function()
      harpoon:list():prev()
    end, { desc = 'Next' })
    vim.keymap.set('n', '<leader>an', function()
      harpoon:list():next()
    end, { desc = 'Previous' })

    -- Set <space>1..<space>5 be my shortcuts to moving to the files
    for _, idx in ipairs { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 } do
      vim.keymap.set('n', string.format('<space>%d', idx), function()
        harpoon:list():select(idx)
      end, { desc = string.format('Harpoon Select %d', idx) })

      vim.keymap.set('n', string.format('<space>a%d', idx), function()
        harpoon:list():replace_at(idx)
      end, { desc = string.format('Harpoon Replace %d', idx) })
    end
  end,
}
