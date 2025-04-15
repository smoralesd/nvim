return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange }
        end,
        styles = {
          comments = {
            italic = false,
          },
        },
      })

      vim.cmd.colorscheme("tokyonight-storm")
    end,
  },

  -- catppucin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        cmp = true,
        dashboard = true,
        gitsigns = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function()
      require("catppuccin").setup({
        custom_highlights = function(colors)
          return {
            CursorLineNr = { fg = colors.peach },
          }
        end,
      })

      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup()

      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
}
