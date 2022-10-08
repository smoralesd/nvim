local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "lua",
    "typescript"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

