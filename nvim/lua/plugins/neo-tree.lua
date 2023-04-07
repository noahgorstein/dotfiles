return {
  "nvim-neo-tree/neo-tree.nvim",
  -- cmd = "Neotree",
  -- keys = {
  --   { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = {
    container = {
      enable_character_fade = true
    },
    filesystem = {
      hide_dotfiles = false,
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}