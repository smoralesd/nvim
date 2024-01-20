return {
  'akinsho/toggleterm.nvim',
	event = "VeryLazy",
  version = "*",
  config = function ()
    require("toggleterm").setup({})

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "curved",
      },
      hidden = true
    })

    ---@diagnostic disable-next-line: lowercase-global
    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true, desc = "Terminal: open lazygit" })
  end
}
