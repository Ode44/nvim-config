return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = false, -- do I really need that?
  config = function()
    require("which-key").setup()
  end,
}
