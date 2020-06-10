
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
        
        call dein#add('flazz/vim-colorschemes')
        call dein#add('vim-scripts/indentpython.vim')
        "call dein#add('scrooloose/nerdtree')
        call dein#add('scrooloose/nerdcommenter')
        call dein#add('scrooloose/syntastic')
        call dein#add('morhetz/gruvbox')
        call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
        call dein#add('jnurmine/Zenburn')
        call dein#add('vim-airline/vim-airline')
        call dein#add('vim-airline/vim-airline-themes')
        call dein#add('tpope/vim-fugitive')
        call dein#add('junegunn/fzf.vim')
        call dein#add('junegunn/fzf')
        "call dein#add('tmux-plugins/vim-tmux')
        call dein#add('whatyouhide/vim-gotham')
        call dein#add('vimwiki/vimwiki')
        call dein#add('guns/xterm-color-table.vim')
        "Plugin 'Valloric/YouCompleteMe'        
        call dein#add('tomasiser/vim-code-dark')
        call dein#add('easymotion/vim-easymotion')
        "call dein#add('christoomey/vim-tmux-navigator')
        " snippet setup        
        "call dein#add('SirVer/ultisnips')
        call dein#add('honza/vim-snippets')

        "Plugin 'bling/vim-bufferline'

        call dein#add('ryanoasis/vim-devicons')

        call dein#end()
        call dein#save_state()
endif
filetype plugin on
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
set nowrap
set nobackup
set termguicolors


let mainWiki = {}
let mainWiki.path='~/vimwiki/main_wiki/'
let mainWiki.html_path='~/vimwiki/html'

let pythonWiki = {}
let pythonWiki.path='~/vimwiki/python_wiki/'
let pythonWiki.html_path='~/vimwiki/html/python'

let configWiki = {}
let configWiki.path='~/vimwiki/config_wiki/'
let configWiki.html_path='~/vimwiki/html/config'

let g:vimwiki_list=[mainWiki, pythonWiki, configWiki]
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

        au BufNewFile,BufRead *.ebnf set filetype=ebnf
augroup end


function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
      return HandleVFileLink(link[1:])
    elseif link =~# '^exe:'
        return HandleExeLink(link[4:])
    else
      return 0
    endif
  endfunction

fu! HandleVFileLink(link)
    let link_infos = vimwiki#base#resolve_link(a:link)
    if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
     return 0
    else
      exe 'edit ' . fnameescape(link_infos.filename)
      return 1
    endif
endfu

fu! HandleExeLink(link)
        try
                "echomsg a:link
                execute a:link
        catch /.*/
                echomsg 'Vimwiki Error: Unable to run command'
                return 0
        endtry
        return 1
endfu
""""""""""""""""""""""""""""""""""
"mappings
"""""""""""""""""""""""""""""""""""
nnoremap <M-o>  o<esc>
nnoremap <M-O>  O<esc>


"=======================
"Buffer mappings
"=======================
nnoremap <leader>b<tab>       :bn<cr>
nnoremap <leader>bp           :bv<cr>
nnoremap <leader>bk           :bd<cr>
nnoremap <leader>bb           :<C-u>CocList buffers<cr>
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

"##############################
"## FZF Stuff #################
"##############################

nnoremap <leader>ff :<C-u>CocList FilE

"=======================
"Terminal related mappings
"=======================

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
nmap f ,s
"nmap <leader>, <Plug>(easymotion-jumptoanywhere)

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-p> :TmuxNavigatePrevious<cr>

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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <F2> <Plug>(coc-rename)

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
nnoremap <silent> <leader>ol  :<C-u>CocList lists<CR>
nnoremap <silent> <leader>of  :<C-u>CocList --auto-preview files<CR>
nnoremap <silent> <leader>oF  :<C-u>CocList folders<CR>




