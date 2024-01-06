return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
  end
}
