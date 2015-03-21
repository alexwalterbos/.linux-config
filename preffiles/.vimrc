"Call the pathogen plugin manager
call pathogen#infect()

set number

"Leader commands
let mapleader = ";"

""horizontal split
map <Leader>h :vs<CR>
imap <Leader>h <Esc>:vs<CR>i

"vertical split
map <Leader>v :sp<CR>
imap <Leader>v <Esc>:sp<CR>i

"Move focus to other window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-w>l
map <C-h> <C-w>h

"Resize windows
map ` <C-W>>
map ~ <C-W><
map + <C-W>+
map - <C-W>-

map <c-f> :call JsBeautify()<cr>

nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

set background=dark

syntax on
filetype indent plugin on
filetype plugin on
set grepprg=grep\ -nH\ $*
set mouse=a
