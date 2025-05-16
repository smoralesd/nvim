local icons = require("icons")
local UtilLsp = require("util.lsp")
local servers = require("plugins.lsp.servers")

return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    version = "4ea9083b6d3dff4ddc6da17c51334c3255b7eba5",
    dependencies = {
      {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
        opts = {
          import = {
            vscode = false,
            coc = false,
            nlsp = false,
          },
        },
        dependencies = { "nvim-lspconfig" },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = servers,
    },
    config = function()
      -- global diagnostic config
      vim.diagnostic.config({
        underline = true,
        float = { border = "rounded", source = "if_many" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
          },
        },
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      })

      -- setup keymaps
      UtilLsp.on_attach(function(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_blink and blink.get_lsp_capabilities() or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      local have_mason, mlsp = pcall(require, "mason-lspconfig")

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          -- run manual setup for server with custom settings
          setup(server)
        end
      end

      if have_mason then
        mlsp.setup({
          ensure_installed = ensure_installed,
          handlers = { setup },
          automatic_enable = true,
        })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "marksman",
        "powershell-editor-services",
        "roslyn",
        "stylua",
        "yaml-language-server",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      local mr = require("mason-registry")

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  -- https://github.com/seblyng/roslyn.nvim
  -- Follow Installation > Manually steps
  -- After installing, make sure to use Mason to install (yes, again) roslyn
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opt = {},
    config = function()
      require("roslyn").setup({})
    end,
  },
}
