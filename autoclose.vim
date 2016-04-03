" Vim plugin to automatically close braces, brackets, etc.
" Name:       AutoClose
" Version:    1.1
" Maintainer: Josh Williams
" License:    GPLv2

function SetAutoClose()
 inoremap <expr> <BS> BackSpace()

 inoremap <expr> " AutoQuote('"')
 
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
endfunction

function NextChar()
 return getline('.')[col('.') - 1]
endfunction
 
function CurChar()
 return getline('.')[col('.') - 2]
endfunction

function GetMatch(char)
 if a:char == '('
  return ')'
 endif
 if a:char == '['
  return ']'
 endif
 if a:char == '{'
  return '}'
 endif
 if a:char == '<'
  return '>'
 endif
 return 'nomatch'
endfunction

function BackSpace()
 if NextChar() != GetMatch(CurChar())
  call feedkeys('OD[3~')
 else
  call feedkeys('xxa')
 endif
 return ''
endfunction

function AutoClose(char)
 let nchar = NextChar()
 if nchar == a:char
  call feedkeys('OC')
  return ''
 endif
 return a:char
endfunction
