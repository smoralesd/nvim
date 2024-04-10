return {
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- json & yaml schema support
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
}
