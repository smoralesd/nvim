local mason_ok, surround = pcall(require, "nvim-surround")
if not mason_ok then
  return
end

surround.setup({})

