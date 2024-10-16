return { -- Autocompletion
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = vim.tbl_extend("force", opts.mapping, { ["<CR>"] = cmp.config.disable })
  end,
}
