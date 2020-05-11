" Vim indent file
" Language: ssh config file
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Original Author: Jason Kim <git@jasonk.me>
" Last Change: 2020-05-10 23:29:09 -0700

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetSshconfigIndent(v:lnum)
setlocal indentkeys=o,O,*<Return>,0=~host\ ,0=~match\ ,0#,!^F

let b:undo_indent = "setlocal autoindent< indentexpr< indentkeys<"

if exists("*GetSshconfigIndent")
  finish
endif

function GetSshconfigIndent(lnum)
  let sw = shiftwidth()
  let prev_line = getline(prevnonblank(a:lnum-1))
  let curr_line = getline(a:lnum)
  if curr_line =~? '^\s*\(host\|match\)\s'
    return 0
  elseif prev_line =~? '^\s*\(host\|match\)\s'
    return sw
  else
    return -1
  endif
endfunction
