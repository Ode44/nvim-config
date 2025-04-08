local v = vim
local Plug = v.fn['plug#']

--options longer than two-three lines
--must live outside current file !
local oil_opts = require 'options.oil-tree'

v.call('plug#begin')

Plug ('tpope/vim-sensible')
Plug ('stevearc/oil.nvim')
Plug ('junegunn/seoul256.vim')
Plug ('mg979/vim-visual-multi', {branch = 'master'})
Plug ('echasnovski/mini.icons', {branch = 'stable'})
Plug ('junegunn/fzf', {['do'] = function() v.fn['fzf#install']() end})

v.call('plug#end')


--theme
v.cmd('silent! colorscheme seoul256')
