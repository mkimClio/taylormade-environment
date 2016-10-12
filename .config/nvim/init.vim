" NOTES
"
" Great presentation on vim
" http://slidedeck.io/inside/vim-presentation

set nocompatible
filetype off

" Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'

" Tools
Plugin 'vim-scripts/Rename2'
Plugin 'tpope/vim-dispatch'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flowtype/vim-flow'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-bundler'

" Tools - Search
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'corntrace/bufexplorer'

" Tools - Git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" Tools - Tab Completion
Plugin 'ervandew/supertab'

" Tools - Formatting
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Languages
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'moll/vim-node'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
" END VUNDLE
"

" Presentation

filetype plugin indent on

au BufRead,BufNewFile *.es6 setfiletype javascript

syntax enable

" If colors not properly working, check this for solutions
" http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
set background=dark
colorscheme solarized
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termcolors=16

set laststatus=2
set encoding=utf-8
set number
set nowrap

" leader character
let mapleader = "\\"

" whitespace
set smarttab
set expandtab
set list listchars=tab:▸\ ,trail:·
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2

" backup
set directory=~/.vim/backup//

" show in title bar
set title
set splitbelow
set splitright

" custom status bar http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
:set statusline=%f         " Path to the file
:set statusline+=%=        " Switch to the right side
:set statusline+=%l:%c     " Current line and column
:set statusline+=/         " Separator
:set statusline+=%L        " Total lines

set hlsearch

" rainbow parentheses

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" syntastic
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=2
" let g:syntastic_cucumber_checkers = []
" let g:syntastic_javascript_checkers = ['eslint']

" ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = 'node_modules\|git'

" ack
if executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
if executable("ag")
  " https://github.com/ggreer/the_silver_searcher
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" NERDtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\/packages']
let NERDTreeShowLineNumbers=1

" javascript-libraries-syntax
" let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,jasmine'

" If 't_vb' is cleared and 'visualbell' is set, "
" no beep and no flash will ever occur "
set visualbell
set t_vb=
set guicursor+=a:blinkon0 " Disable gui cursor blinking "

" Inspired by https://github.com/tpope/vim-unimpaired "
" Sets paste on and set nopaste when leaving insert mode "
" using an autocommand "
nnoremap <silent> yo  :set paste<cr>o
nnoremap <silent> yO  :set paste<cr>O

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
        \     set nopaste |
            \ endif

" CUSTOM KEY BINDINGS

" remap soft bol and eol
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <C-j> }
nnoremap <C-k> {

" start/end of line
map H ^
map L $

" flow
nnoremap <leader>f :FlowMake<cr>

" window resizing
nnoremap <Up> <C-w>-<C-w>-
nnoremap <Down> <C-w>+<C-w>+
nnoremap <Left> <C-w><<C-w><
nnoremap <Right> <C-w>><C-w>>

" force hjkl
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" tabs
nnoremap tn :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt

" vim-rspec commands
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" Allow clipboard access just with y and p. Needs vim 7.4 to work.
" https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed

" jsx highlighting
let g:jsx_ext_required = 0

" neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'ErrorMsg',
      \ }
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'NeomakeWarningSign'
      \ }