syntax on
colorscheme base

filetype plugin on
set autoindent
set smartindent

set number
set paste

packloadall

let g:ale_linters = { 'rust' : ['analyzer'] }
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun
