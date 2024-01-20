function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0, desc = "Terminal: switch to normal mode" })

  vim.keymap.set("t", "<C-Left>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-Down>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-Up>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-Right>", [[<Cmd>wincmd l<CR>]], opts)

  vim.keymap.set("t", "<F6>", [[<Cmd>ToggleTerm<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://*toggleterm* lua set_terminal_keymaps()")
