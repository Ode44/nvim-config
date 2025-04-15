print "Still, not good enough."
--options longer than two-three lines
--must live outside current file !

vim.opt.number = true
vim.opt.relativenumber = true

--hardcoded indentation
vim.opt.sts = 2    --softtabstop
vim.opt.sw  = 2    --shiftwidth
vim.opt.sta = true --smartab uses 'sw'
vim.opt.et  = true --expandtab

--enchance vim experience
vim.opt.path:append('**') --recursive `:find`

--DANGER: do not confirm file writes changes
vim.o.confirm = false   

require('config.lazy')
require('telescope').setup()
require('oil').setup(require('options.oil_tree')) 
require'nvim-treesitter.install'.update({ with_sync = true })
require('custom.f_term') --requires separate fzf but input lag made me not like it
require('mini.icons').setup()

require('lsp')
require ('remaps') 
