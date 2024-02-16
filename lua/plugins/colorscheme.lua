return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.orange }
      end,
    })

    vim.cmd.colorscheme("tokyonight-moon")
  end,
}
