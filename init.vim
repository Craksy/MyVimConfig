
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc



if &compatible
  set nocompatible
endif
   "Add the dein installation directory into runtimepath
set runtimepath+=~/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dein')
        call dein#begin('~/dein')
        call dein#add('~/dein/repos/github.com/Shougo/dein.vim')
        "plugins go here
        
        
        "call dein#add('Shougo/deoplete.nvim')


        call dein#add('vim-scripts/indentpython.vim')
        call dein#add('scrooloose/nerdtree')
        call dein#add('scrooloose/nerdcommenter')
        call dein#add('scrooloose/syntastic')
        call dein#add('morhetz/gruvbox')
        call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
        "Plugin 'valloric/youcompleteme'
        "Plugin 'Shougo/deoplete.nvim'        
        call dein#add('jnurmine/Zenburn')
        call dein#add('vim-airline/vim-airline')
        call dein#add('vim-airline/vim-airline-themes')
        call dein#add('tpope/vim-fugitive')
        "call dein#add('junegunn/fzf.vim')
        "call dein#add('junegunn/fzf')

        "Plugin 'terryma/vim-multiple-cursors'
        call dein#add('whatyouhide/vim-gotham')

        "Plugin 'Valloric/YouCompleteMe'        
        call dein#add('tomasiser/vim-code-dark')
        call dein#add('easymotion/vim-easymotion')

        " snippet setup        
        "call dein#add('SirVer/ultisnips')
        call dein#add('honza/vim-snippets')

        "Plugin 'bling/vim-bufferline'

        call dein#add('ryanoasis/vim-devicons')

        call dein#end()
        call dein#save_state()
endif
filetype plugin indent on
syntax enable
colorscheme gruvbox


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
set expandtab
set incsearch
set signcolumn=yes
set updatetime=300
set shortmess+=c




"========================================
"Airline configuration
"========================================
source $HOME/.config/nvim/airline-init.vim


"========================================
"Auto commands
"========================================
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
        
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


""""""""""""""""""""""""""""""""""
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
nnoremap <leader>ft  :NERDTreeToggle<cr>
nnoremap <leader>fe  :e<space>
nnoremap <leader>fs  :w<cr>
nnoremap <leader>fvv :e ~/.vimrc<cr>
nnoremap <leader>fvn :e $MYVIMRC<cr> 
nnoremap <leader>fvr :so $MYVIMRC<cr>

"=======================
"Terminal related mappings
"=======================
nnoremap <leader>tt  :term
nnoremap <leader>ts  :split

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


"======================
"Command mappings
"=======================
"nmap <leader><leader>s <Plug>(easymotion-s)
map ,  <Plug>(easymotion-prefix)
nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
"nmap <leader>, <Plug>(easymotion-jumptoanywhere)


"=======================
" Practise mappings
"=======================
nnoremap <esc> <nop>
nnoremap <Right> <nop>
nnoremap <Left> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
inoremap <esc> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

map ;     :


"=======================
"Suggestions and autocompletions
"=======================

inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap  <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)



xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


nnoremap <silent> <leader>oa  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>oe  :<C-u>CocList extensions<cr>
" " Show commands.
nnoremap <silent> <leader>oc  :<C-u>CocList commands<cr>
" " Find symbol of current document.
nnoremap <silent> <leader>oo  :<C-u>CocList outline<cr>
" " Search workspace symbols.
nnoremap <silent> <leader>os  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
nnoremap <silent> <leader>oj  :<C-u>CocNext<CR>
" " Do default action for previous item.
nnoremap <silent> <leader>ok  :<C-u>CocPrev<CR>
" " Resume latest coc list.
nnoremap <silent> <leader>op  :<C-u>CocListResume<CR>
nnoremap <silent> <leader>of  :<C-u>CocList lists<CR>




