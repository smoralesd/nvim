vim.opt.number = true -- show numbers on each line
vim.opt.relativenumber = true -- use relative numbers by default

vim.opt.termguicolors = true -- enables 24-bit colors

vim.opt.cursorline = true -- highlight the line the cursor is in

vim.opt.wrap = false -- disable line wrapping

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hidden = true

vim.opt.splitbelow = true -- split a new window below/to the right by default
vim.opt.signcolumn = 'yes' -- always show the sign/gutter column so the content does not shift

vim.opt.showmode = false -- mode is shown via lualine

vim.cmd [[ set listchars=tab:▸\ ,eol:¬,trail:· ]] -- set visible chars for invisible white spaces
vim.cmd [[ highlight TrailingWhitespace ctermbg=red guibg=red]] -- create new highlight group for trail spaces

vim.cmd [[colorscheme tokyonight-night]]

vim.cmd [[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
		let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
]]
