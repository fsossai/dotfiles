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
set cursorline
set encoding=utf8
let g:airline_powerline_fonts = 1
syntax on
colorscheme tokyonight-night 
highlight cursorline guibg=#3a3a3a
highlight Visual guibg=#555555
" highlight Visual guibg=#101010 guifg=#a0a0a0

" --- files ----------------------------------------------------------

autocmd BufRead,BufNewFile *.job set syntax=bash
autocmd BufReadPost *.bc :call OpenBitcode()

" --- map ------------------------------------------------------------

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-p> :wincmd p<CR>
nmap <silent> <A-Space> :wincmd w<CR>
vnoremap <silent> <Leader>d :<c-u>call Demangle()<CR>
nnoremap <leader>q :nohlsearch<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>s :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hlsearch<CR>
nnoremap <C-A-H> :vertical resize +5<CR>
nnoremap <C-A-L> :vertical resize -5<CR>
nnoremap <C-A-J> :resize +3<CR>
nnoremap <C-A-K> :resize -3<CR>
nnoremap k -
nnoremap - j
nnoremap + k
nnoremap = k
nnoremap Z 2<C-E>
nnoremap X 2<C-Y>
nnoremap <C-A-E> 3<C-E>
nnoremap <C-A-X> 3<C-Y>
nnoremap <C-A-Y> 3<C-Y>
nnoremap <C-X> <C-Y>
nnoremap < <C-E>
nnoremap > <C-Y> 
nnoremap u :undo<CR>
nnoremap U :redo<CR>
nnoremap <C-G> :Telescope grep_string<CR>
nnoremap <C-S> :Telescope git_status<CR>
nnoremap <C-R> :Buffer<CR>
nnoremap <C-A-R> :Telescope find_files<CR>
nnoremap <leader>t :NvimTreeFocus<CR>
nnoremap <leader>e :Texplore<CR>
nnoremap <leader>g :Neogit cwd=%:p:h<CR>
nnoremap <leader>G :Neogit<CR>
nnoremap <leader>` :FloatermNew --cwd=<buffer><CR>
nnoremap <C-P> :Buffer<CR>
nnoremap <F6> :FloatermNew<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap ! :bprevious<CR>
nnoremap @ :bnext<CR>
nnoremap Q :buffer #<CR>
nnoremap <leader>r :bdelete %<CR>
nnoremap <leader>m :call WrapOrNowrap()<CR>
vnoremap <leader>c :'<,'>!lua ~/.config/nvim/lua/comment.lua %:e<CR>
vnoremap <leader>C :'<,'>!lua ~/.config/nvim/lua/uncomment.lua %:e<CR>
vnoremap <leader>z :<C-U>call NoelleSCC("enable","selection")<CR>
nnoremap <leader>z :<C-U>call NoelleSCC("enable","all")<CR>
vnoremap <leader>Z :<C-U>call NoelleSCC("disable","selection")<CR>
nnoremap <leader>Z :<C-U>call NoelleSCC("disable","all")<CR>
nnoremap <leader>v :call ReplaceInplace()<CR>

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

function! NoelleSCC(action, mode)
  if a:mode == "all"
    let lines = getline(1, "$")
  elseif a:mode == "selection"
    let lines = getline(getpos("'<")[1], getpos("'>")[1])
  else
    return
  endif

  let cmd = "lua ~/.config/nvim/lua/noelle_scc.lua "
  let cmd = cmd . a:action . " " . a:mode
  execute system(cmd, lines)
endfunction

function! ReplaceInplace()
  normal! caw
  normal! "0p
endfunction
