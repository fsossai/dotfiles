set tabstop=2 expandtab
set shiftwidth=2
set hlsearch
set backspace=indent,eol,start
set number
syntax on

map <C-j> :m .+1<CR>==
map <C-k> :m .-2<CR>==
map <C-j> <Esc>:m .+1<CR>==gi
map <C-k> <Esc>:m .-2<CR>==gi
map <C-j> :m '>+1<CR>gv=gv
map <C-k> :m '<-2<CR>gv=gv
