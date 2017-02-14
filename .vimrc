" Some general overrides
set nocompatible
syntax enable
set path+=**
set wildmenu
" adds ':MakeTags' command (tries to generate c tags from current dir)
" Lookup on how to use properly ^[ ^]
command! MakeTags !ctags -R .

" Remap leader
let mapleader = ","
" Remap v and Ctrl-V
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v
" --- Plugin Inclusion [Begin] ---
" Specify dir for plugins
call plug#begin('~/.vim/plugged')

"Load plugins from github
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

runtime plugin/dragvisuals.vim
" --- Plugin Inclusion [End] ---

" --- Make settings [Begin] ---
au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %
" --- Make settings [End] ---

" --- Plugin Settings [Begin] ---
" Vim airline settings
set laststatus=2 " Always show statusline
let g:airline_powerline_fonts=1 " Use Powerline Fonts

" NerdTree options
"autocmd vimenter * NERDTree " Start NERDTree automatically with vim
map <C-n> :NERDTreeToggle<CR>
" Close vim if NerdTree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Dragging controls with 'Dragvisuals' plugin
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" 'HUD' for Ctrl-k special-char menu
inoremap <expr>  <C-K>   HUDG_GetDigraph()

nmap <leader>l  :call ListTrans_toggle_format()<CR>
vmap <leader>L  :call ListTrans_toggle_format('visual')<CR>
" --- Plugin Settings [End] ---

" Alternative to exit to normal mode
imap jj <ESC>

" Setting for vim-tabs (not working with every terminal)
" in zsh you need to include 'stty -ixon' to your .zshrc?
noremap <C-Tab> gt<CR>
noremap <C-S-Tab> gT<CR>
noremap <C-T> :tabnew<CR>
" Unmap the arrow keys / switch position of lines with Up and Down (in normal mode)
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Option to add second quote or parenthase
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>< <><ESC>i
" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set number  " Show Line-Numbers
set showcmd " Show commands in bottom bar
set listchars=tab:>~
",<CR>
set list

" Spaces instead of tabs / Tabwidth 2:
set tabstop=2 shiftwidth=2 expandtab
