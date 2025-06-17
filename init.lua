--options longer than two-three lines
--must live outside current file !

vim.opt.number         = true
vim.opt.relativenumber = true

--hardcoded indentation
vim.opt.sts            = 2 --Softtabstop
vim.opt.sw             = 2 --Shiftwidth
vim.opt.sta            = true --Smartab uses 'sw'
vim.opt.et             = true --Expandtab

vim.diagnostic.config({
  virtural_text = false,
  underline = false,
  signs = false --fixed annoying text shift
})

--Enhanced vim experience
vim.opt.path:append('**') --recursive `:find`
vim.opt.termguicolors = true

--skip confirmation file writes changes
vim.o.confirm = false

require('config.lazy')
require('telescope').setup({
  pickers = {
    find_files = {
      hidden = true
    }
  }
})
require('oil').setup(require('options.oil_tree'))
require 'nvim-treesitter.install'.update({ with_sync = true })
require('mini.icons').setup()

vim.notify = require('notify')
require('notify').setup(require('options.notify'))

require('remaps')

-- I though it will be cool. But --
-- require('custom.f_term') -- Input lag between term and fish autocomplete
