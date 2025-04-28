return {
  -- work with diff hunks
  -- replaces gitsigns
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    keys = {
      {
        "<leader>go",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay",
      },
    },
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "+",
          change = "~",
          delete = "-",
          topdelete = "‾",
          changedelete = "~~",
        },
      },
    },
  },

  -- A pretty list for showing diagnostics, references, quickfix and location lists to help you solve all the trouble your code is causing.
  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics(Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
}
