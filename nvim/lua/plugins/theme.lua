return {
  -- Theme
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup()
    vim.cmd [[colorscheme kanagawa]]
  end,
}
-- return {
--   -- Theme
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('tokyonight').setup({
--       style = "night",
--     })
--     vim.cmd [[colorscheme tokyonight]]
--   end,
--   opts = {
--     style = "moon",
--   }
-- }
