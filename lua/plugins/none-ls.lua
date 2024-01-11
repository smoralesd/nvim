return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = 'format document' })
    vim.keymap.set("n", "<s-a-f>", vim.lsp.buf.format, { desc = "format document" })
  end,
}
