return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.fn.expand("$HOME") .. "/AppData/Local/nvm/v22.13.0/node",
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {
      headers = {
        user = "  Sebastian  ",
        assistant = "  Copilot  ",
      },
      window = {
        width = 0.4,
      },
    },
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>ap", "", desc = "+Copilot", mode = { "n", "v" } },
      {
        "<leader>apa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>apx",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>apq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
      -- Show prompts actions with a picker
      {
        "<leader>app",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
  {
    "coder/claudecode.nvim",
    opts = {
      terminal = {
        split_width_percentage = 0.40,
      },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>ac", "", desc = "+Claude", mode = { "n", "v" } },
      { "<leader>acc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>acf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>acr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>acC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>acb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>acs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>acs",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>acd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
