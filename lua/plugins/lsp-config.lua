return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "eslint" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.eslint.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover documentation" })
      vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, { desc = 'signature documentation' })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = '[r]e[n]ame' })
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = '[r]e[n]ame' })

      local builtin = require('telescope.builtin')

      vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = '[g]oto [d]efinition' })
      vim.keymap.set("n", "<F12>", builtin.lsp_definitions, { desc = 'goto definition' })
      vim.keymap.set("n", "gr", builtin.lsp_references, { desc = '[g]oto [r]eferences' })
      vim.keymap.set("n", "<s-F12>", builtin.lsp_references, { desc = 'goto references' })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = '[c]ode [a]ction' })
    end,
  },
}
