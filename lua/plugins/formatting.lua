return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
