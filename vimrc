set tabstop=2 expandtab
set shiftwidth=2
set hlsearch
set backspace=indent,eol,start
set number
set nowrap
set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
syntax on

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" map <C-Right> 1zl
" map <C-Left> 1zh

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'eandrju/cellular-automaton.nvim'
Plug '~/.fzf'
"Plug 'Valloric/YouCompleteMe'
call plug#end()

set termguicolors
syntax on
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1

colorscheme tokyonight-night
"colorscheme murphy
hi Normal guibg=none

au BufRead,BufNewFile *.job set syntax=bash

function! Demangle()
  let lines = getline(getpos("'<")[1], getpos("'>")[1])
  echo system("c++filt", join(lines, "\n")) "\n"
endfunction

vnoremap <silent> <Leader>d :<c-u>call Demangle()<CR>

nnoremap <leader>q :noh<CR>
nnoremap <leader>w :w<CR>

