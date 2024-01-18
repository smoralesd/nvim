local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<c-Left>", "<C-w>h", { noremap = true, silent = true, desc = "Move to the window on the Left" })
keymap("n", "<c-Down>", "<C-w>j", { noremap = true, silent = true, desc = "Move to the window Below" })
keymap("n", "<c-Up>", "<C-w>k", { noremap = true, silent = true, desc = "Move to the window Above" })
keymap("n", "<c-Right>", "<C-w>l", { noremap = true, silent = true, desc = "Move to the window on the Right" })

keymap("n", "<c-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save changes on the current buffer/file" })

-- Diagnostics

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
local openDiagnosticIfNoFloat = function()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
	-- THIS IS FOR BUILTIN LSP
	vim.diagnostic.open_float(0, {
		scope = "cursor",
		focusable = false,
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
		},
	})
end

vim.keymap.set("n", "<leader>dd", openDiagnosticIfNoFloat, { desc = "Diag: show diagnostics info" })
vim.keymap.set("n", "<leader>di", vim.diagnostic.goto_next, { desc = "Diag: go to next diagnostics" })
vim.keymap.set("n", "<leader>do", vim.diagnostic.goto_prev, { desc = "Diag: go to prev diagnostics" })
