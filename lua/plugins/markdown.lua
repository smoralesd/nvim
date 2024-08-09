return {
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
}
