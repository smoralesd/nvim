local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'path' }, -- from file paths
    { name = 'nvim_lsp' }, -- from language server
    { name = 'buffer' }, -- from current buffer
  }),
})

vim.cmd [[
  set completeopt=menu,menuone,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
