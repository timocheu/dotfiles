" Use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" For vim's netrw, built-in file explorer 
set nocp
filetype plugin on

" Color theme from gruvbox 
set background=dark
let g:gruvbox_termcolors=16
colorscheme gruvbox
hi LineNr guifg=#83a598

" For prettier.coc 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
