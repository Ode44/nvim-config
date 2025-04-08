print "Still, not good enough."

require ('plugins')
require ('remaps') 

vim.opt.relativenumber = true
vim.opt.number = true

--hardcoded indentation
vim.opt.sts = 2    --softtabstop
vim.opt.sw  = 2    --shiftwidth
vim.opt.sta = true --smartab uses 'sw'
vim.opt.et  = true --expandtab

--enchance vim experience
vim.opt.path:append('**') --recursive `:find`

--DANGER: do not confirm file writes, due to oil-tree confirmation
vim.o.confirm = false   

--initialize installed plugins
require('mini.icons').setup()
require('oil').setup(require('options.oil_tree')) 

--themes enabled
require('onenord').setup()
