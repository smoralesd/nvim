local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

local opt = vim.opt

opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

opt.clipboard = "unnamedplus" -- Sync with system clipboard

require("lazy").setup({
  { "echasnovski/mini.surround", version = "*", opts = {} },
  { "echasnovski/mini.pairs", version = "*", opts = {} },
})
