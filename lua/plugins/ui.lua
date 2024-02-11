return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("config.icons").git

      return {
        options = {
          theme = "tokyonight",
          globalstatus = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {
            { 'branch' },
            { 'diagnostics' }
          },
          lualine_c = {'filename'},
          lualine_x = {
            'filetype',
            {
              'diff',
              symbols = {
                added = icons.added,
                modified = icons.modified,
                removed = icons.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict

                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { 'progress', separator = " ", padding = { left = 1 , right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function ()
              return " " .. os.date("%R")
            end
          },
        },
        extensions = { "neo-tree", "lazy" }
      }
    end,
  },

  -- Displays a popup with possible key bindings of the command you started typing
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["s"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>s"] = { name = "+search" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
}
