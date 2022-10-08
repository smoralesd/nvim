local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lsp.setup({
  ensure_installed = {
    "sumneko_lua",
    "tsserver"
  }
})
