local map = vim.keymap.set

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
