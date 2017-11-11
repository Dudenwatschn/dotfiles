" Some general overrides
set nocompatible
filetype plugin on
set hidden
" syntax enable " Disabled for vimwiki (might also work with enable instead of on)
syntax on
set path+=**
set wildmenu
" Allow execution of a second .vimrc file from current dir
set exrc
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
Plug 'sjl/gundo.vim', { 'dir': '~/.vim/plugged/gundo'}
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-surround' " cs (change surrounding) from to; cst (change surrounding to); ds (delete surr); yss) surround line
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'Valloric/YouCompleteMe'
" Project plugins
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'LucHermitte/vim-build-tools-wrapper'

Plug 'WolfgangMehner/c-support' " Plugins below still need to be checked (excluding CTRL-P)
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Fuzzy filesearch
Plug 'kien/ctrlp.vim'

" Initialize plugin system
call plug#end()

runtime plugin/dragvisuals.vim
" --- Plugin Inclusion [End] ---

" --- CtrlSpace Settings [Begin] ---
set showtabline=0
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
" --- CtrlSpace Settings [End] ---

" --- Gundo Settings [Begin] ---
let g:gundo_prefer_python3 = 1
nnoremap gu :GundoToggle<CR>
" --- Gundo Settings [End] ---

" --- Language settings [Begin] ---
au FileType c set makeprg=gcc\ %
" au FileType cpp set makeprg=g++\ %
" au FileType cpp command Run !./a.out

" Open cppman when pressing Ctrl-K
command! -nargs=+ Cppman silent! call system("tmux split-window -v cppman " . expand(<q-args>))
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
" --- Language settings [End] ---

" --- Plugin Settings [Begin] ---
" Vim airline settings
set laststatus=2 " Always show statusline
let g:airline_powerline_fonts=1 " Use Powerline Fonts
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'
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
set secure
