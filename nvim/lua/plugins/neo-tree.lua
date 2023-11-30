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
    filesystem = {
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      follow_current_file = {
        enabled = true,          -- This will find and focus the file in the active buffer every time
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
}
