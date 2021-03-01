" vim:foldmethod=marker


"----------------------------SUPERIOR VIMRC------------------------------------


filetype plugin indent on

" PLUGINS----------------------------------------------------------{{{1

call plug#begin('~/local/share/nvim/plugged')

Plug 'morhetz/gruvbox' "color theme

"Airline status line
Plug 'vim-airline/vim-airline' "status line
Plug 'vim-airline/vim-airline-themes' "status line theme
Plug 'ryanoasis/vim-devicons' "status line icons

"Fern file tree
Plug 'lambdalisue/fern.vim' "file tree
Plug 'lambdalisue/nerdfont.vim' "icons for fern tree
Plug 'lambdalisue/fern-renderer-nerdfont.vim' "icons for fern tree
Plug 'lambdalisue/fern-git-status.vim' "git icons for fern

"Fuzzy Search
Plug 'junegunn/fzf.vim' "finder

"Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto complete

"Other 
Plug 'preservim/nerdcommenter' "Comment helper
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } "hex color preview
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'tpope/vim-surround'

call plug#end()


    " PLUGIN CONFIG------------------------------------------------{{{

    colorscheme gruvbox                 "Setting the colorscheme
    let g:airline_theme = 'gruvbox'     "Setting the airline theme
    let g:fern#renderer = "nerdfont"    "Setting the fern icons
    let g:airline_powerline_fonts = 1   "Setting the airline fonts

    if (has("termguicolors"))
     set termguicolors
    endif

    command! -nargs=0 Prettier :CocCommand prettier.formatFile


    "}}}

" NAVIGATION-------------------------------------------------------{{{1

set number                  "Show line numbers
set relativenumber          "Show the line number relative to the cursor
set incsearch               "Search as you type
set ignorecase smartcase    "Ignore case until an uppercase letter
set iskeyword&              "Recognising words
set scrolloff=8             "Keep cursor away from this many chars top/bot


" FORMATTING-AND-LOOKS---------------------------------------------{{{1

syntax on                   "Syntax coloring
set smartindent             "Indent 'Smartly'
set shiftwidth=4            "Number of spaces to shift for autoindent or >,<
set softtabstop=4           "Spaces per psuedo tab 
set expandtab               "Convert tabs to spaces
set nowrap                  "Dont wrap the text
set foldcolumn=1            "The with of the left column about folds
set cursorline              "Highlighting the line with the cursor
set lazyredraw              "Dont show keymap action until it finishes


" COMPLETION-------------------------------------------------------{{{1

set wildmode=longest,list   "Show possible completions on command line
set clipboard+=unnamedplus


" BACKUPS----------------------------------------------------------{{{1

set shada='1000,f1,<500     "The history of mark and cursor etc.
set hidden                  "Don't prompt to save hidden windows until exit
set nobackup
set nowritebackup


" KEY MAPPINGS-----------------------------------------------------{{{1

let mapleader=" "

nmap <F3> :nohlsearch<CR>


    "NAVIGATE-----------------------------------------------------{{{2
    
    " use crtl+hjkl to move between split/vsplit panels
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l


    "TERMINAL-----------------------------------------------------{{{2
        
    " open new split panes to right and below
    set splitright
    set splitbelow
    " turn terminal to normal mode with escape
    tnoremap <Esc> <C-\><C-n>
    " start terminal in insert mode
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    " open terminal on ctrl+n
    function! OpenTerminal()
      split term://bash
      resize 10
    endfunction
    nnoremap <c-n> :call OpenTerminal()<CR>


    "FERN---------------------------------------------------------{{{2

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


source $HOME/.config/nvim/plug-config/coc.vim
