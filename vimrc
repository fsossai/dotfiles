" --- plugins --------------------------------------------------------

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'eandrju/cellular-automaton.nvim'
Plug '~/.fzf'
" Plug 'Valloric/YouCompleteMe'
call plug#end()

" --- general --------------------------------------------------------

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
set termguicolors
syntax on
colorscheme tokyonight-night
hi Normal guibg=none

" --- files ----------------------------------------------------------

autocmd BufRead,BufNewFile *.job set syntax=bash
autocmd BufReadPost *.bc :call OpenBitcode()

" --- map ------------------------------------------------------------

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
vnoremap <silent> <Leader>d :<c-u>call Demangle()<CR>
nnoremap <leader>q :nohlsearch<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>s :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hlsearch<CR>
inoremap i +
nnoremap k -
nnoremap - j
nnoremap + k
nnoremap = k
nnoremap Z <C-E>
nnoremap X <C-Y>
nnoremap < <C-E>
nnoremap > <C-Y>
nnoremap ! :bprevious<CR>
nnoremap @ :bnext<CR>
nnoremap Q :buffer #<CR>
nnoremap <leader>r :bdelete %<CR>
nnoremap <leader>m :call WrapOrNowrap()<CR>

" --- functions ------------------------------------------------------

function! WrapOrNowrap()
  if execute('set wrap?') =~# 'nowrap'
    set wrap
  else
    set nowrap
  endif
endfunction

function! Demangle()
  let lines = getline(getpos("'<")[1], getpos("'>")[1])
  echo system("c++filt", join(lines, "\n")) "\n"
endfunction

function! OpenBitcode()
  if filereadable(expand('%:r') . '.ll')
    edit %:r.ll
    set syntax=lifelines
  else
    silent execute '%!llvm-dis -f -o /dev/stdout %'
    file %:r.ll
    set syntax=lifelines
    set readonly
  endif
endfunction

