return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.fn.has("win32") == 1
          and vim.fn.expand("$HOME") .. "/AppData/Local/nvm/v22.13.0/node"
          or "node",
      should_attach = function(bufnr, bufname)
        local filetype = vim.bo[bufnr].filetype

        if filetype == "AgenticInput" then
          return true
        end

        -- delegate to default behavior for other filetypes
        local default_should_attach = require("copilot.config.should_attach").default
        return default_should_attach(bufnr, bufname)
      end
    },
  },
  {
    "carlos-algms/agentic.nvim",
    opts = {
      provider = "copilot-acp",
      headers = {
        chat = {
          title = "  Copilot  ",
        }
      },
    },
    keys = {
      { "<leader>a",  "",                                                  desc = "+Copilot",                    mode = { "n", "v" } },
      { "<leader>ac", function() require("agentic").toggle() end,          desc = "Toggle Copilot",              mode = { "n", "v" } },
      { "<leader>af", function() require("agentic").add_file() end,        desc = "Add current file to context", mode = { "n", "v" } },
      { "<leader>an", function() require("agentic").new_session() end,     desc = "Start new session",           mode = { "n", "v" } },
      { "<leader>ar", function() require("agentic").restore_session() end, desc = "Restore session",             mode = { "n", "v" } },
    },
  },
}
