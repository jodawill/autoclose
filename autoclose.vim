" Vim plugin to automatically close braces, brackets, etc.
" Name:       AutoClose
" Version:    1.0
" Maintainer: Josh Williams
" License:    GPLv2

inoremap { {}<Esc>i
inoremap <expr> } AutoClose('}')

inoremap {<CR> {<CR>}<Esc>O
inoremap <expr> } AutoClose('}')

inoremap ( ()<Esc>i
inoremap <expr> ) AutoClose(')')

inoremap [ []<Esc>i
inoremap <expr> ] AutoClose(']')

inoremap < <><Esc>i
inoremap <expr> > AutoClose('>')

function AutoClose(char)
 let cchar = getline('.')[col('.')-1]
 if cchar == a:char
  call feedkeys('OC')
  return ''
 endif
 return a:char
endfunction
