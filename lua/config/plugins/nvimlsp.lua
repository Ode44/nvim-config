return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  -- example using `opts` for defining servers
  opts = {
    defaults = {
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- opts[server].capabilities, if you've defined it
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    },
    servers = {
      lua_ls = {},
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(opts.defaults)
    end
    -- typescript lsp is a separate freaking plugin --
    local ts_ls = require("config.plugins.ts-tools")
    ts_ls.setup()
  end,
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- Needs to be loaded in first
    enable = false,
    config = function()
      require("tiny-inline-diagnostic").setup(require("options.tiny_diagnostics"))
    end,
  },

  -- example calling setup directly for each LSP
  -- config = function()
  --   local capabilities = require('blink.cmp').get_lsp_capabilities()
  --   local lspconfig = require('lspconfig')
  --
  --   lspconfig['lua_ls'].setup({ capabilities = capabilities })
  -- end
}
