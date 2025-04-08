local v = vim
local Plug = v.fn['plug#']

--options longer than two-three lines
--must live outside current file !

v.call('plug#begin')

Plug ('tpope/vim-sensible')
Plug ('stevearc/oil.nvim')
Plug ('mg979/vim-visual-multi', { branch = 'master' })
Plug ('echasnovski/mini.icons', { branch = 'stable' })
Plug ('junegunn/fzf', { ['do'] = function() v.fn['fzf#install']() end })

--themes
Plug 'junegunn/seoul256.vim'
Plug ('rmehri01/onenord.nvim', { branch = 'main' })
v.call('plug#end')

--custom or local mini-plugins
require('plugins.f_term')
