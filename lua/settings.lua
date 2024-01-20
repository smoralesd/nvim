vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.opt.number = true         -- show numbers on each line
vim.opt.relativenumber = true -- use relative numbers by default

vim.opt.cursorline = true     -- highlight the line the cursor is in

vim.opt.wrap = false          -- disable line wrapping

vim.opt.showmode = false      -- mode is shown via lualine

vim.opt.splitbelow = true     -- split a new window below/to the right by default

vim.opt.signcolumn = "yes"    -- always show the signcolumn

vim.opt.ignorecase = true     -- ignore case while searching
vim.opt.smartcase = true      -- allows to override ignorecase by using upper case characters while searching

vim.opt.hidden = true

vim.opt.shell = "pwsh" -- set shell to Powershell Core
-- see :help shell-powershell
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
