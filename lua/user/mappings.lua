local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<c-Left>", "<C-w>h", { noremap = true, silent = true, desc = "Move to the window on the Left" })
keymap("n", "<c-Down>", "<C-w>j", { noremap = true, silent = true, desc = "Move to the window Below" })
keymap("n", "<c-Up>", "<C-w>k", { noremap = true, silent = true, desc = "Move to the window Above" })
keymap("n", "<c-Right>", "<C-w>l", { noremap = true, silent = true, desc = "Move to the window on the Right" })

-- fast vertical split
keymap("n", "<Leader>v", ":vsplit<cr>", { noremap = true, silent = true, desc = "Vertical split" })

-- File/buffer operations
keymap("n", "<Leader>w", ":write<cr>", { noremap = true, silent = true, desc = "Write current buffer" })
keymap("n", "<Leader>q", ":quit<cr>", { noremap = true, silent = true, desc = "Close current buffer" })

keymap("n", "<Leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true, desc = "Toogle file tree explorer" })

keymap("n", "<C-p>", ":Telescope find_files<cr>", { noremap = true, silent = true, desc = "Telescope: find file" })

-- Git
keymap("n", "<Leader>gp", ":Gitsigns preview_hunk<cr>", { noremap = true, silent = true, desc = "Git: preview hunk under cursor" })
keymap("n", "<Leader>ggp", ":Gitsigns prev_hunk<cr>", { noremap = true, silent = true, desc = "Git: go to prev hunk" })
keymap("n", "<Leader>ggn", ":Gitsigns next_hunk<cr>", { noremap = true, silent = true, desc = "Git: go to prev hunk" })
keymap("n", "<Leader>gl", ":Gitsigns setqflist<cr>", { noremap = true, silent = true, desc = "Git: list all hunks" })
