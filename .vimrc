" Some general overrides
set nocompatible
filetype plugin on
"set t_Co=256
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

" --- Nvim Settings [Begin --- {{{1
if has('nvim')
  tnoremap <Esc> <C-\><C-n>   " Esc escapes terminal mode
  "g:loaded_python_provider=1  " Enable Python2 support
  "g:loaded_python3_provider=1 " Enable Python3 support
  colorscheme elflord "'ron' is also a similar theme
  let g:CtrlSpaceDefaultMappingKey = "<C-space> " " Fix CtrlSpace hotkey.
endif
" --- Nvim Settings [Begin --- }}}1

" --- Plugin Inclusion [Begin] --- {{{
" Specify dir for plugins
call plug#begin('~/.vim/plugged')

"Load plugins from github
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim', { 'dir': '~/.vim/plugged/gundo'}
Plug 'vimwiki/vimwiki'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'tpope/vim-surround' " cs (change surrounding) from to; cst (change surrounding to); ds (delete surr); yss) surround line
Plug 'vim-ctrlspace/vim-ctrlspace'

" Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
" Project plugins
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'LucHermitte/vim-build-tools-wrapper'

Plug 'WolfgangMehner/c-support', {'for': ['c', 'cpp']} " Plugins below still need to be checked (excluding CTRL-P)
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Fuzzy filesearch
Plug 'kien/ctrlp.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'"Py autocomplete
Plug 'fisadev/vim-isort', {'for': 'py'} "Sort python imports
Plug 'mhinz/vim-signify' " Diff view
Plug 'tpope/vim-surround'
" Initialize plugin system
call plug#end()

runtime plugin/dragvisuals.vim
" }}} --- Plugin Inclusion [End] ---

" --- CtrlSpace Settings [Begin] ---
set showtabline=0
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
" --- CtrlSpace Settings [End] ---

" --- Gundo Settings [Begin] ---
let g:gundo_prefer_python3 = 1
nnoremap gu :GundoToggle<CR>
" --- Gundo Settings [End] ---

autocmd BufWritePre * %s/\s\+$//e " Remove all trailing whitespaces on save
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb % " Automatically run xrdb when saving .Xresources or .Xdefaults

" --- Language settings [Begin] ---
autocmd FileType vimrc setlocal foldmethod=marker
" autocmd FileType c setlocal foldmethod=syntax
" autocmd FileType cpp setlocal foldmethod=syntax
au FileType c set makeprg=gcc\ %
" au FileType cpp set makeprg=g++\ %
" au FileType cpp command Run !./a.out

" Open cppman when pressing Ctrl-K
command! -nargs=+ Cppman silent! call system("tmux split-window -v cppman " . expand(<q-args>))
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
" --- Language settings [End] ---

" --- Plugin Settings [Begin] ---

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
"let g:syntastic_error_symbol = '?'
"let g:syntastic_warning_symbol = '?'
"let g:syntastic_style_error_symbol = '?'
"let g:syntastic_style_warning_symbol = '?'

" Jedi-vim ------------------------------

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Deoplete ------------------------------

let g:deoplete#enable_at_startup = 1
let g:deoplete#camel_case = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237 ctermfg=227
" Vim airline settings
set laststatus=2 " Always show statusline
let g:airline_powerline_fonts=1 " Use Powerline Fonts
" YouCompleteMe settings
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'
" NerdTree options
"autocmd vimenter * NERDTree " Start NERDTree automatically with vim
map <C-n> :NERDTreeToggle<CR>
" Make sure python is active!
map <C-l> :LLPStartPreview<CR>
" Close vim if NerdTree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" C-Support settings
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen  = 'yes'


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
imap <leader>{ {<CR>}<ESC>O

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set number  " Show Line-Numbers
set relativenumber " Relative numbers to cursor
set showcmd " Show commands in bottom bar
" set listchars=tab:>~,trail:•
set list
set history=1000

" Spaces instead of tabs / Tabwidth 2:
set tabstop=2 shiftwidth=2 expandtab
set shiftround " Tab always indent to next multiple of shiftwidth
set secure
