" ===================================================================================
" Key bindings
" ===================================================================================

" Exit & Save
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Open netrw (file explorer)
nnoremap <leader>e :Explore<CR>

inoremap <C-Space> <C-X><C-O>

" reload vim config
" https://dev.to/reobin/reload-init-vim-without-restarting-neovim-1h82#:~:text=After%20editing%20your%20init.,instead%20of%20quitting%20and%20restarting.
nnoremap <silent> <leader>r :e $MYVIMRC<cr>
