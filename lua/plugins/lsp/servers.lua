return {
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },

  marksman = {},

  ts_ls = {
    keys = {
      {
        "<leader>co",
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.organizeImports.ts" },
              diagnostics = {},
            },
          })
        end,
        desc = "Organize Imports",
      },
      {
        "<leader>cR",
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.removeUnused.ts" },
              diagnostics = {},
            },
          })
        end,
        desc = "Remove Unused Imports",
      },
    },
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  },

  eslint = {
    settings = {
      workingDirectory = { mode = "auto" },
    },
    on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },

  jsonls = {
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    -- Have to add this for yamlls to understand that we support line folding
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.yaml.schemas =
        vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
    end,
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = {
          enable = true,
        },
        validate = true,
        schemaStore = {
          -- Must disable built-in schemaStore support to use
          -- schemas from SchemaStore.nvim plugin
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = "",
        },
      },
    },
  },

  powershell_es = {
    bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
    settings = {
      init_options = {
        enableProfileLoading = false,
      },
    },
  },

  -- omnisharp = {
  --   handlers = {
  --     ["textDocument/definition"] = function(...)
  --       return require("omnisharp_extended").handler(...)
  --     end,
  --   },
  --   keys = {
  --     {
  --       "gd",
  --       function()
  --         require("omnisharp_extended").lsp_definitions()
  --       end,
  --       desc = "Goto Definition",
  --     },
  --   },
  --   enable_roslyn_analyzers = true,
  --   organize_imports_on_format = true,
  --   enable_import_completion = true,
  -- },
}
