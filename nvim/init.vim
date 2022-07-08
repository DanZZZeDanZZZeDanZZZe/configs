" Vim configuration file
" use :so ~/.vimrc for reload config
"
" base taken from https://www.youtube.com/watch?v=WlIcPT9Sr-c


" enable mouse support "
set mouse=a

" enable syntax "
syntax on

" enable plugin on (for newtrw)
filetype plugin on

" enable line numbers "
set number

" use system register for copy and past
set clipboard=unnamedplus

" highlight current line "
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" enable highlight search pattern "
set hlsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation using spaces "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab
set autoindent

" show the matching part of pairs [] {} and () "
set showmatch

" remove trailing whitespace from js, html, css, ts files "
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.ts :%s/\s\+$//e

" enable color themes "
"if !has('gui_running')
"	set t_Co=256
"endif
" enable true colors support "
"syntax on
set termguicolors
" use colorscheme "
colorscheme onehalflight
" use background light/dark
" set background = dark

"-------------------------------------------------------------"
"Bonus. " Find & Replace (if you use the ignorecase, smartcase these are mandatory) "
"            :%s/<find>/<replace>/g   "replace global (e.g. :%s/mass/grass/g)"
"            :%s/<find>/<replace>/gc  "replace global with confirmation"
"            :%s/<find>/<replace>/gi  "replace global case insensitive"
"            :%s/<find>/<replace>/gI  "replace global case sensitive"
"            :%s/<find>/<replace>/gIc "replace global case sensitive with confirmation"

"        " Vim (book)marks "
"            mn     "replace n with a word A-Z or number 0-9"
"            :'n     "go to mark n"
"            :`.     "go to the last change"
"            :marks  "show all declared marks"
"            :delm n "delete mark n"

"        " Delete range selection "
"            :<line_number>,<line_number>d "(e.g. :2,10d deletes lines 2-10)"

"        " LaTeX shortcuts "
"            nnoremap <F1> :! pdflatex %<CR><CR>
"            nnoremap <F2> :! bibtex $(echo % \| sed 's/.tex$//') & disown<CR><CR>
"            nnoremap <F3> :! evince $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
"            nnoremap <F4> :! rm *.log *.aux *.out *.blg & disown<CR><CR>
"-------------------------------------------------------------"
"features taken from https://www.youtube.com/watch?v=XA2WjJbmmoM&t=35s

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer



" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
" I use this ctags realisation: https://github.com/universal-ctags/ctags-snap#readme
" Creating a tags folder example: universal-ctags --recurse=yes --exclude=node_modules --map-javascript=.jsx .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags



" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list



" FILE BROWSING:

" Tweaks for browsing
" let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
" let g:netrw_liststyle=3     " tree view
"let g:netrw_winsize = 25

"augroup ProjectDrawer " auto open
"  autocmd!
"  autocmd VimEnter * :Vexplore
" augroup END
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" TODO: read about
" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" ===================================================================================
" ALE
" ===================================================================================

let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = ''

" Declare my file types
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Use fixers
let js_fixers = ['prettier', 'eslint']

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': js_fixers,
\ 'jsx': js_fixers,
\ 'typescript': js_fixers,
\ 'typescriptreact': js_fixers,
\ 'css': ['prettier'],
\ 'json': ['prettier'],
\ 'markdown': ['prettier'],
\ 'rust': ['rustfmt', 'rls'],
\}

" ===================================================================================
" Plugins
" ===================================================================================

" https://github.com/junegunn/vim-plug
call plug#begin()

" Linting and syntax checking
" htps://github.com/dense-analysis/ale#usage
Plug 'dense-analysis/ale'

" Telescope popup finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons' " use bufferline extension
" Plug 'ryanoasis/vim-devicons' " Icons without colours

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Tabs
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Theme
Plug 'Mofiqul/dracula.nvim'

" Easy motion
Plug 'phaazon/hop.nvim'

" Better code highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colorize hex color codes
Plug 'ap/vim-css-color'

call plug#end()

" ===================================================================================
" Hop
" ===================================================================================

lua << EOF
require("bufferline").setup{}
EOF

" ===================================================================================
" Hop
" ===================================================================================

"TODO: разобраться и поставить привязки клавиш
lua << EOF
local hop = require('hop')
hop.setup()
EOF

" close popup by the q key
lua << EOF
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
}
EOF

" TODO: разобраться с расширением для табов

" ===================================================================================

" ===================================================================================

lua << EOF
require'nvim-tree'.setup {
}
EOF

" ===================================================================================
" Imports
" ===================================================================================
"runtime $HOME/.config/nvim/maps.vim
runtime ./maps.vim
" TODO: вынести так же плагины
