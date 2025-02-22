call plug#begin()
    " Themes
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }    
    Plug 'feline-nvim/feline.nvim'
    Plug 'EdenEast/nightfox.nvim'

    " Aesthetics
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-commentary'
	Plug 'yggdroot/indentline'

    " Ease Plugins
	Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'rafaqz/ranger.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
  	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'barrett-ruth/live-server.nvim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'folke/trouble.nvim'
    Plug 'mistricky/codesnap.nvim', { 'do': 'make' }
    Plug 'mhartington/formatter.nvim'
call plug#end()

