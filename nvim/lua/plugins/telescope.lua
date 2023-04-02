return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
  end
}
