set nocompatible
" set filetype=on 

" for MacVim not to lookup /usr/local/* entries 
let $PATH=substitute($PATH, "/usr/local[^:]\\+:", "", "g")

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax on

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype on

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'

" Bundles
" vim-scripts
Bundle "SelectBuf"
Bundle "SuperTab-continued."
Bundle "The-NERD-tree"
Bundle "Wombat"
Bundle "wombat256.vim"
Bundle "genutils"
Bundle "EasyMotion"
Bundle "DoxygenToolkit.vim"
Bundle "vim-go"
" github
Bundle "groenewege/vim-less"
Bundle "plasticboy/vim-markdown"
Bundle "kien/ctrlp.vim"
Bundle 'mileszs/ack.vim'
Bundle "Lokaltog/vim-powerline"
Bundle "tpope/vim-git"
Bundle "vim-gitgutter"

set backupskip=/tmp/*,/private/tmp/*"

try
  colorscheme wombat256mod
catch
endtry

hi Search cterm=NONE ctermfg=green ctermbg=blue

set background=dark
filetype plugin on
syntax on

" Autosettings
augroup mkd
  autocmd FileType mkd setlocal ai spell nofoldenable colorcolumn=80
  " old options: formatoptions=tcroqn2 comments=n:&gt;
augroup END

augroup commit
  autocmd FileType gitcommit,cvs setlocal spell textwidth=72 colorcolumn=73
augroup END

" Add a closing bracket and a semicolon by doing (; 
autocmd FileType javascript inoremap (; ();<Esc>hi

" Add a newline and a closing brace by doing {<CR>
autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>

" Ignore the text that was typed and save the file by doing ``w
inoremap ``w <Esc>:w!<CR>i

" Enable the status bar
set laststatus=2

set number        " show line numbers
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
"set wrap
set nowrap        " don't wrap lines
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start  " allowing backspacing over everything in Insert mode
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set ignorecase    " ignore case when searching
set nobackup      " no backup
set noswapfile    " no swap file

set history=1000      " remember more commands and search history
set undolevels=1000   " use many much levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title             " change the terminal's title
set visualbell        " don't beep
set noerrorbells      " don't beep


" Mappings 
" <Esc><mappedKey> = command 
"   Tab nav
map ;] :tabnext<cr>
map ;[ :tabprevious<cr>
map <c-t> :tabnew<cr>

nmap t :NERDTree<cr>

"  Pane navigation map
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

" Work
set expandtab
set shiftwidth=2

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|CVS$\|\.svn$\|target$',
  \ 'file': '\.class$\|\.so$',
  \ }
let g:ctrlp_extensions = ['dir', 'mixed']
let g:vundle_default_git_proto = 'git'
let g:YUNOcommit_after = 20
let g:jedi#auto_initialization = 0

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Doxygen plugin settings
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param  "
let g:DoxygenToolkit_returnTag="@return  "
let g:DoxygenToolkit_authorName="Ashish Raste"

" Cursor color modification
  if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;red\007 for gnome-terminal
  endif

filetype plugin on
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'


let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set nocp

" For Golang syntax highlighting
filetype off
filetype plugin indent off
set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

