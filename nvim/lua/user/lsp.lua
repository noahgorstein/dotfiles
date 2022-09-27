local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)

  -- we want to use null-ls instead 
  if client.name == "tsserver" or client.name == "pylsp" then
    client.resolved_capabilities.document_formatting = false
  end

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  buf_set_keymap("n", "r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', 
      maxwidth = 50, 
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})


require("lspconfig").pylsp.setup {
  capabilities=capabilities,
  on_attach=on_attach,
  settings = {
    pylsp = {
      plugins = {
        yapf = { enabled = false},
        autopep8 = { enabled = false},
        pyflakes = { enabled = false},
        black = {enabled = true},
        flake8 = { enabled = true},
        pycodestyle = { enabled = false},
        pyflakes = { enabled = false},
        pylint = { enabled = false},
        mccabe = { enabled = false},
      }
    }
  }
}

require("lspconfig").tsserver.setup{
  capabilities=capabilities,
  on_attach=on_attach
}

require("lspconfig").bashls.setup{
  capabilities=capabilities,
  on_attach=on_attach
}

require("lspconfig").sparql.setup {
  cmd = { "node", "/Users/noahgorstein/.nvm/versions/node/v8.17.0/lib/node_modules/sparql-language-server/dist/cli.js",
    "--stdio" },
  filetypes = { "sparql", "rq" },
  capabilities=capabilities,
  on_attach = on_attach
}

require("lspconfig").gopls.setup {
  capabilities=capabilities,
  on_attach = on_attach
}

require("lspconfig").prosemd_lsp.setup {
  capabilities=capabilities,
  on_attach=on_attach
}

vim.diagnostic.config{                                                                                                   
  virtual_text = true,                                                                                                   
  signs = true,                                                                                                          
  underline = true,                                                                                                      
  update_in_insert = true,                                                                                               
  severity_sort = false,                                                                                                 
}  
