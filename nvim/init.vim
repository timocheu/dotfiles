set rnu
set cul 
set nocompatible
set hidden
set guicursor=n-v-c-i:block


" <Tab> distance
set tabstop=4
set shiftwidth=4
set expandtab

" Additional config files
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/keymaps.vim
source ~/.config/nvim/config/settings.vim

lua require('coc')
lua require('treesitter-configs')
lua require('live-server').setup(opts)

