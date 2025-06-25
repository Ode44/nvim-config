return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "javascript",
        "lua",
        "bash",
        "json",
        "yaml",
        "rust",
        "python",
        "markdown",
        "rust",
        "bitbake",
      },
      auto_install = true, -- this is the important part
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
  end,
}
