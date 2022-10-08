local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  return
end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  },
  finder_action_keys = {
    quit = "<Esc>"
  },
  code_action_keys = {
    quit = "<Esc>"
  },
  definition_action_keys = {
    quit = "<Esc>"
  }
}

local function get_ops(desc)
  return { noremap = true, silent = true, desc = 'LSP Saga: ' .. desc }
end

vim.keymap.set('n', '<F8>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', get_ops('Jump to next diagnostic'))
vim.keymap.set('n', '<S-F8>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', get_ops('Jump to prev diagnostic'))
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', get_ops('Hover docs'))
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', get_ops('Find definition, references, implementations'))
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', get_ops('Preview definition'))
vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', get_ops('Rename symbol under the cursor'))
vim.keymap.set('n', '<Leader><space>', '<Cmd>Lspsaga code_action<CR>', get_ops('Invoke code action'))
