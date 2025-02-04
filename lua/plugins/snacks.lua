return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      git = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      scroll = { enabled = true },
    },
    keys = {
      {
        "<leader>gb",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Git Blame Line",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.indent():map("<leader>ug")

          Snacks.toggle({
            name = "Render Markdown",
            get = function()
              return require("render-markdown.state").enabled
            end,
            set = function(enabled)
              local m = require("render-markdown")
              if enabled then
                m.enable()
              else
                m.disable()
              end
            end,
          }):map("<leader>um")
        end,
      })
    end,
  },
}
