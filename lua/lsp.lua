local cmp = require'cmp'

cmp.setup({
   snippet = {
      expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      end,
   },
   mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
      if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
   }
})

-- Setup lspconfig.
local lsp_defaults = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').tsserver.setup {
  capabilities = lsp_defaults
}

require('lspconfig').svelte.setup {
   capabilities = lsp_defaults
}

vim.cmd([[nnoremap gd :lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[nnoremap K :lua vim.lsp.buf.hover()<CR>]])
vim.cmd([[nnoremap <leader>. :lua vim.lsp.buf.code_action()<CR>]])
vim.cmd([[nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>]])
