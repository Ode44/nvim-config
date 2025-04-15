-- return { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- optional but useful to auto-update parsers
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "bash", "json", "yaml", "rust", "python", "markdown", "rust", -- add more as needed
      },
      auto_install = true, -- this is the important part
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}

