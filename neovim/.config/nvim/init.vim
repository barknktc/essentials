" vim:foldmethod=marker

filetype plugin indent on

" PLUGINS----------------------------------------------------------{{{1
call plug#begin('~/local/share/nvim/plugged')

Plug 'tomasiser/vim-code-dark' "color theme
Plug 'vim-airline/vim-airline' "status line
Plug 'vim-airline/vim-airline-themes' "status line theme
Plug 'ryanoasis/vim-devicons' "status line icons
Plug 'lambdalisue/nerdfont.vim' "icons for fern tree
Plug 'lambdalisue/fern-renderer-nerdfont.vim' "icons for fern tree

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } "hex color preview

Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim' "file tree
Plug 'tpope/vim-surround'

call plug#end()

    " PLUGIN CONFIG------------------------------------------------{{{

    colorscheme codedark
    if (has("termguicolors"))
     set termguicolors
    endif
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'codedark'
    let g:fern#renderer = "nerdfont"
    "}}}

" NAVIGATION-------------------------------------------------------{{{1

set number
set relativenumber
set incsearch
set ignorecase smartcase
set iskeyword&
set so=8


" FORMATTING-AND-LOOKS---------------------------------------------{{{1

syntax on
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
set foldcolumn=2
set cursorline
set lazyredraw

" COMPLETION-------------------------------------------------------{{{1

set wildmode=longest,list
set clipboard+=unnamedplus


" BACKUPS----------------------------------------------------------{{{1

set shada='1000,f1,<500



" KEY MAPPINGS-----------------------------------------------------{{{1

let mapleader=" "

nmap <F3> :nohlsearch<CR>
    "FERN---------------------------------------------------------{{{

    let g:fern#disable_default_mappings = 1
    noremap <F2> <Esc>:Fern . -drawer -reveal=% -toggle -width=30<CR><C-w>= 
    function! FernInit() abort
        nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
        nmap <buffer> l <Plug>(fern-action-expand:stay)
        nmap <buffer> h <Plug>(fern-action-collapse)
        nmap <buffer> n <Plug>(fern-action-new-path)
        nmap <buffer> c <Plug>(fern-action-copy)
        nmap <buffer> m <Plug>(fern-action-move)
        nmap <buffer> M <Plug>(fern-action-rename)
        nmap <buffer> d <Plug>(fern-action-remove)
        nmap <buffer> r <Plug>(fern-action-reload)
        nmap <buffer> o <Plug>(fern-action-hidden:toggle)
        nmap <buffer> v <Plug>(fern-action-open:vsplit)
        nmap <buffer> b <Plug>(fern-action-open:split)
        nmap <buffer><nowait> > <Plug>(fern-action-enter)
        nmap <buffer><nowait> < <Plug>(fern-action-leave)
        nmap <buffer> <leader> <Plug>(fern-action-mark)
    endfunction

    augroup FernGroup
      autocmd!
      autocmd FileType fern call FernInit()
    augroup END
    "}}}

" OTHER------------------------------------------------------------{{{1

set showmatch
set mouse=v
set cc=80
let g:cursorhold_updatetime = 100

"disabling netrw
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

