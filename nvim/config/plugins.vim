call plug#begin()
    " Aesthetics
    Plug 'tpope/vim-commentary'
	Plug 'yggdroot/indentline'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }    
    Plug 'feline-nvim/feline.nvim'

    " Ease Plugins
  	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'rafaqz/ranger.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'barrett-ruth/live-server.nvim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'mistricky/codesnap.nvim', { 'do': 'make' }
call plug#end()

