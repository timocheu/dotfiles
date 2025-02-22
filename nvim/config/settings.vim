" Use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" For vim's netrw, built-in file explorer 
" set nocp
" filetype plugin on

" THEME
colorscheme carbonfox

" For prettier.coc 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
