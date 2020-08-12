" ----------------------------------------------------------------------------
" Goodies for FZF-preview & FZF
" ----------------------------------------------------------------------------
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
autocmd  BufLeave *   set laststatus=2 ruler

" ----------------------------------------------------------------------------
" CONFIGURATION
" ----------------------------------------------------------------------------
" fzf
" Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_preview_buffers_jump = 1
" floating windows from preview also for FZF!
let g:fzf_layout = { 'window': 'call fzf_preview#window#create_centered_floating_window()' }


" fzf-preview
" see plugin/fzf-addons.vim for custom methods
" let g:fzf_preview_use_dev_icons = 1
" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --no-ignore-vcs --files --ignore-file $DOTFILES_PRIVATE/agignore --hidden --no-messages -g \!"* *"'
let g:fzf_preview_filelist_command = 'rg --files --ignore-file $DOTFILES_PRIVATE/agignore --hidden --no-messages -g \!"* *"' " Installed ripgrep

let g:fzf_preview_fzf_preview_window_option = 'right:45%'
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" ----------------------------------------------------------------------------
" MAPPINGS
" ----------------------------------------------------------------------------
" we keep the FZF logic with "," prefix
nnoremap ,z :call FzfSpell()<CR>

" ----------------------------------------------------------------------------
" COMMANDS
" ----------------------------------------------------------------------------
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" ----------------------------------------------------------------------------
" ADDONS
" ----------------------------------------------------------------------------

" Spell replacement for "z=" thanks to Corey Alexander
" https://dev.to/coreyja/vim-spelling-suggestions-with-fzf-1ccc
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

" Fugitive integration for fzf-preview
nnoremap <silent> ’<space> :<C-u>FzfPreviewGitStatus -processors=g:fzf_preview_fugitive_processors<CR>

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fugitive_add(paths) abort
  for path in a:paths
    execute 'silent G add ' . path
  endfor
  echomsg 'Git add ' . join(a:paths, ', ')
endfunction

function! s:fugitive_reset(paths) abort
  for path in a:paths
    execute 'silent G reset ' . path
  endfor
  echomsg 'Git reset ' . join(a:paths, ', ')
endfunction

function! s:fugitive_patch(paths) abort
  for path in a:paths
    execute 'silent tabedit ' . path . ' | silent Gdiff'
  endfor
  echomsg 'Git add --patch ' . join(a:paths, ', ')
endfunction

function! s:fzf_preview_settings() abort
  let g:fzf_preview_fugitive_processors = fzf_preview#resource_processor#get_processors()
  let g:fzf_preview_fugitive_processors['ctrl-a'] = function('s:fugitive_add')
  let g:fzf_preview_fugitive_processors['ctrl-r'] = function('s:fugitive_reset')
  let g:fzf_preview_fugitive_processors['ctrl-c'] = function('s:fugitive_patch')
endfunction
