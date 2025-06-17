return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = false,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 300,
        lsp_fallback = true,
      },
      formatters = {
        prettier = {
          command = "./node_modules/.bin/prettier",
          args = {
            "--stdin-filepath", "$FILENAME",
          },
          cwd = require("conform.util").root_file({ ".prettierrc", "package.json" }),
        },
      },
    })
  end,
}
