set nocompatible

let mapleader = "\<Space>"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Add your plugins below this line
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
Plugin 'Shougo/deoplete.nvim'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasiser/vim-code-dark'
Plugin 'easymotion/vim-easymotion'
" snippet setup
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'bling/vim-bufferline'
Plugin 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


let g:UltiSnipsExpandTrigger="½"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"




set nu relativenumber
set hidden
set wildmenu
set showcmd
set hlsearch
set confirm
set mouse=a
set cmdheight=2
set splitbelow
set splitright
nohl
set foldmethod=indent
set foldlevel=99
syntax enable
set expandtab
set tabstop=2
set incsearch

augroup MyAutoCmds
        au!
        au BufNewFile,BufRead *.py
                                \set tabstop=4
                                \ set softtabstop=4
                                \ set shiftwidth=4
                                \ set textwidth=79
                                \ set expandtab
                                \ set autoindent

        au InsertEnter * :set norelativenumber
        au InsertLeave * :set relativenumber
augroup end




"let python_highlight_all=1




"""""""""""""""""""""""""""""""""""
"mappings
"""""""""""""""""""""""""""""""""""
"=======================
"Buffer mappings
"=======================
nnoremap <leader>b<tab>       :bn<cr>
nnoremap <leader>bp           :bv<cr>
nnoremap <leader>bk           :bd<cr>
nnoremap <leader>bb           :ls<cr>
nnoremap <leader>bav          :vert ball<cr>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

inoremap jk <esc>

nnoremap <leader>hl :nohl<CR>
"=======================
"File related mappings
"=======================
nnoremap <leader>tt  :NERDTreeToggle<cr>
nnoremap <leader>fe  :e<space>
nnoremap <leader>fs  :w<cr>
nnoremap <leader>fvd :e ~/.vimrc<cr>
nnoremap <leader>fvr :so ~/.vimrc<cr>

"=======================
"Window related mappings
"=======================
nnoremap <leader>wv           :vs<cr>
nnoremap <leader>wl           <c-w>l
nnoremap <leader>wh           <c-w>h
nnoremap <leader>wj           <c-w>j
nnoremap <leader>wk           <c-w>k
nnoremap <leader>wq           :q<cr>
nnoremap <leader>wtm          :ter ++rows=5<cr>
nnoremap <leader><tab>        :bn<cr>


"=======================
"Command mappings
"=======================
"nmap <leader><leader>s <Plug>(easymotion-s)
nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
nmap <leader><leader>, <Plug>(easymotion-jumptoanywhere)
nnoremap <leader>. :FZF<cr>

"=======================
"Jumping
"=======================
nnoremap <leader>jd :YcmCompleter GoToDefinition<cr>
nnoremap <leader>jj :YcmCompleter GoTo<cr>


"=======================
"Practise mappings
"=======================
inoremap <esc> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>








"air-line
let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
 endif

     " unicode symbols
     let g:airline_left_sep = '»'
     let g:airline_left_sep = '▶'
     let g:airline_right_sep = '«'
     let g:airline_right_sep = '◀'
     let g:airline_symbols.linenr = '␊'
     let g:airline_symbols.linenr = '␤'
     let g:airline_symbols.linenr = '¶'
     let g:airline_symbols.branch = '⎇'
     let g:airline_symbols.paste = 'ρ'
     let g:airline_symbols.paste = 'Þ'
     let g:airline_symbols.paste = '∥'
     let g:airline_symbols.whitespace = 'Ξ'

     " airline symbols
     let g:airline_left_sep = ''
     let g:airline_left_alt_sep = ''
     let g:airline_right_sep = ''
     let g:airline_right_alt_sep = ''
     let g:airline_symbols.branch = ''
     let g:airline_symbols.readonly = ''
     let g:airline_symbols.linenr = ''



let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_splits=1
let g:airline#extensions#tabline#buffer_idx_mode = 1

colorscheme zenburn
