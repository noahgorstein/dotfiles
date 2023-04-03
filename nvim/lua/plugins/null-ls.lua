return {
  'jose-elias-alvarez/null-ls.nvim',
  config = {
    sources = {
      require("null-ls").builtins.formatting.black,
      require("null-ls").builtins.formatting.prettierd,
      require("null-ls").builtins.formatting.stylua,
      -- require("null-ls").builtins.diagnostics.eslint
    }
  }
}
