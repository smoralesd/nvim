local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  -- silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local leader_mappings = {
  f = {
    name = "Find (Telescope)",
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    l = { "<cmd>Telescope live_grep<cr>", "Live grep" }
  },
  g = {
    name = "Git signs",
    g = {
      name = "Go to",
      p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
      n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" }
    },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk under cursor" },
    l = { "<cmd>Gitsigns setqflist<cr>", "List all hunks" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff current buffer" },
    b = {
      name = "Blame",
      b = { "<cmd>Gitsigns blame_line<cr>", "Blame current line" },
      t = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame current line" }
    }
  },
  t = {
    name = "Terminal",
    t = { "<cmd>ToggleTerm<cr>", "Toggle the terminal" }
  },
  h = {
    name = "Highlights",
    l = { "<cmd>set list!<cr>", "Toggle whitespace visibility" },
    w = { "<cmd>match TrailingWhitespace /\\s\\+$/<cr>", "Highlights trailing whitespaces" },
    o = { "<cmd>match<cr>", "Turn off highlights" },
  },
  w = { "<cmd>w<cr>", "Write file" },
  q = { "<cmd>q<cr>", "Close file" },
  v = { "<cmd>vsplit<cr>", "Vertical split" },
  e = { "<cmd>NvimTreeToggle<cr>", "Toogle file tree explorer" }
}

wk.setup()
wk.register(leader_mappings, opts)
