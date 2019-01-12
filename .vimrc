set mouse=a

" copied and pasted from https://realpython.com/vim-and-python-a-match-made-in-heaven/
" on July 1, 2018
set nocompatible              " required
filetype off                  " required


" copied from https://github.com/arusahni/dotfiles/blob/45c6655d46d1f672cc36f4e81c2a674484739ebc/vimrc#L42
" on Jan 12, 2019
" checks/installs vundle
if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif
if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python'
    endif
endif

" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python syntax checking
"Plugin 'vim-syntastic/syntastic'""not working w/ python3
"PEP8 checking
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

"directory explorer
Plugin 'scrooloose/nerdtree'

"git commands
Plugin 'tpope/vim-fugitive'

"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set clipboard=unnamed


" copied from
" https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'junegunn/fzf'
"Plugin 'junegunn/fzf.vim'
"map ; :Files<C-P>

Plugin 'anntzer/vim-cython'
Plugin 'lambdalisue/vim-cython-syntax'
" Plugin 'tshirtman/vim-cython'



" PDX quizor vimrc
" Last edited Fri May 27 00:51:42 PDT 2016
" NOTE: all of the commands can be researched by looking
"  up documentation with :help <topic>

filetype indent plugin on
syntax on " turn on syntax highlighting
set number " line numbers
set ruler
" color had to be moved to end of file
" set color scheme to desert, more schemes in vim's color folder
"color desert
set background=dark

" search options
" highlight search results, toggle with :set highlight! or disable with :noh
set hlsearch
 " show incremental matches to search options as it is being typed
set incsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set nostartofline
set autoindent
set laststatus=2 " always display status
set confirm
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set smartindent

" save on refocus
:au FocusLost * :wa " will complain on untitled and read-only buffers
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" function to restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

" autocommands
" restore cursor
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

colorscheme default
