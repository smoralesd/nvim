return {
  {
    "rest-nvim/rest.nvim",
    init = function()
      -- keys (from lazy.nvim) does not seem to work with rest.nvim
      -- using an auto command to create keymaps for the plugin
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function()
          vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { buffer = true, desc = "Run Rest Request" })
        end,
      })
    end,
  },
}
