" Basic config
" imap kj <Esc>

" Tab navigation Mapping
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" Ranger keymaps
map <leader>rr :RangerEdit<cr>
map <leader>rv :RangerVSplit<cr>
map <leader>rs :RangerSplit<cr>
map <leader>rt :RangerTab<cr>
map <leader>ri :RangerInsert<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
map <leader>rd :RangerCD<cr>
map <leader>rld :RangerLCD<cr>

" FZF mapping
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>qq :Files<CR>
" nnoremap <silent> <Leader>rg :Rg<CR>
nnoremap <silent> <Leader>ww :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" Keymap Config shortcut
map <Leader>km :edit ~/.config/nvim/config/keymaps.vim<CR>
map <Leader>;; :source ~/.config/nvim/init.vim<CR>
