" ===================================================================================
" Vanila
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

" ===================================================================================
" Telescope
" ===================================================================================

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_t

" ===================================================================================
" Bufferline
" ===================================================================================

nnoremap <C-j> :BufferLineCycleNext<CR>
nnoremap <C-k> :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <leader>mj :BufferLineMoveNext<CR>
nnoremap <leader>mk :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
" nnoremap <leader>be :BufferLineSortByExtension<CR>
" nnoremap <leader>bd :BufferLineSortByDirectory<CR>
" nnoremap <leader><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" ===================================================================================
" NvimTree
" ===================================================================================

nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>

" ===================================================================================
" Hop
" ===================================================================================

nnoremap <C-h> :HopWord<CR>

" ===================================================================================
" Ale
" ===================================================================================

nnoremap <leader>aa :ALEHover<CR>
nnoremap <leader>ad :ALEGoToDefenition<CR>
nnoremap <leader>at :ALEGoToTypeDefenition<CR>
