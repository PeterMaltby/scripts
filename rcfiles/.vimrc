syntax on
colorscheme base

filetype plugin on
set autoindent
set smartindent

set number
set paste

" template related stuff
augroup templates
	au!
	autocmd BufNewFile *.* silent! execute ' 0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")
	autocmd BufNewFile * %substitute#\[:EVAL:\]\(.\{-\}\)\[:END:\]#\=eval(submatch(1))#ge
augroup END


" rust stuff
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

" status lines

set laststatus=2
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
