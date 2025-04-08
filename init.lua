print "Still, not good enough."

require ('plugins')
require ('remaps') 

local o = vim.opt

o.relativenumber = true
o.number = true

--hardcoded indentation

o.sts = 2    --softtabstop
o.sw  = 2    --shiftwidth
o.sta = true --smartab uses 'sw'
o.et  = true --expandtab

--enchance vim experience
o.path:append('**') --recursive `:find`

--initialize installed plugins
require("oil").setup(oil_opts)
require('mini.icons').setup()
