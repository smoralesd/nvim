local terminal = require("util.terminal")

local map = vim.keymap.set

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- lazygit
map("n", "<leader>gg", function()
  terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit" })
