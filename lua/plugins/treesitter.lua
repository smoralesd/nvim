local utils = require("util.treesitter")

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bicep",
      "c_sharp",
      "diff",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "kusto",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }

    require("nvim-treesitter").setup()
    -- update the already installed parsers table
    -- has() reads from the same table
    utils.get_installed(true)

    local missing = vim.tbl_filter(function(lang)
      return not utils.has(lang)
    end, parsers)

    if #missing > 0 then
      require("nvim-treesitter").install(missing, { summary = true }):await(function()
        utils.get_installed(true)
      end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
      callback = function(ev)
        local ft = ev.match -- match is the filetype of the buffer that triggered the event
        local lang = vim.treesitter.language.get_lang(ft)

        if not utils.has(lang) then
          return
        end

        -- start treesitter => enable highlighting
        if utils.has(ft, "highlights") then
          pcall(vim.treesitter.start, ev.buf)
        end

        -- use nvim-treesitter indentations if available
        if utils.has(ft, "indents") then
          vim.api.nvim_set_option_value(
            "indentexpr",
            "v:lua.require'nvim-treesitter'.indentexpr()",
            { scope = "local" }
          )
        end
      end,
    })
  end,
}
