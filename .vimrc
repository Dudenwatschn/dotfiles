" Alternative to exit to normal mode
imap jj <ESC>

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

" Spaces instead of tabs / Tabwidth 2:
set tabstop=2 shiftwidth=2 expandtab
