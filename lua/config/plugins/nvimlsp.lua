return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  -- example using `opts` for defining servers
  opts = {
    defaults = {
      root_dir = function(fname)
        local util = require("lspconfig.util")
        return util.root_pattern("tsconfig.json", "package.json", "jsconfig.json")(fname) or util.path.dirname(fname)
      end,
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- opts[server].capabilities, if you've defined it
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    },
    servers = {
      lua_ls = {},
      ts_ls = {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        -- root_dir = function(fname)
        --   local util = require("lspconfig.util")
        --   return util.root_pattern("tsconfig.json", "package.json", "jsconfig.json")(fname) or util.path.dirname(fname)
        -- end,
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(opts.defaults)
    end
  end,
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- Needs to be loaded in first
    enable = false,
    config = function()
      require("tiny-inline-diagnostic").setup(require("options.tiny_diagnostics"))
      -- vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
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
