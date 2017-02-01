" Specify dir for plugins
call plug#begin('~/.vim/plugged')

"Load plugins from github
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter' 

Plug 'WolfgangMehner/c-support' " Plugins below still need to be checked (excluding CTRL-P)
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'honza/vim-snippets'

Plug 'rkulla/pydiction.git'

" Fuzzy filesearch
Plug 'kien/ctrlp.vim'

" Initialize plugin system
call plug#end()

" NerdTree options
"autocmd vimenter * NERDTree " Start NERDTree automatically with vim
map <C-n> :NERDTreeToggle<CR>
" Close vim if NerdTree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Alternative to exit to normal mode
imap jj <ESC>

" Remap leader
let mapleader = ","
" Unmap the arrow keys / switch position of lines with Up and Down (in normal mode)
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Option to add second quote or parenthase
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set number  " Show Line-Numbers
set showcmd " Show commands in bottom bar

" Spaces instead of tabs / Tabwidth 2:
set tabstop=2 shiftwidth=2 expandtab
