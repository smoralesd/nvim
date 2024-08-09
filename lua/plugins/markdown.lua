return {
  -- Markdown browser preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    ft = { "markdown" },
  },
  -- Markdown in-nvim rendering
  {
    "MeanderingProgrammer/markdown.nvim",
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    keys = {
      {
        "<leader>um",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Render Markdown",
      },
    },
  },
}
