
if (!exists("g:plugs['denite.nvim']"))
    finish
endif

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
  nnoremap <nowait> <silent><buffer><expr> o
        \ denite#do_map('do_action', 'drop')
  nnoremap <silent><buffer><expr> v
        \ denite#do_map('toggle_select')
  nnoremap <silent><buffer><expr> <tab>
        \ denite#do_map('choose_action')
endfunction

autocmd FileType denite-filter call s:denite_filter_settings()
function! s:denite_filter_settings() abort
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer> <C-n> <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-p> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
    inoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
    inoremap <silent><buffer><expr> <C-g> denite#do_map('quit')
endfunction

let s:denite_options = {
      \ 'prompt' : '❯',
      \ 'start_filter': 1,
      \ 'winheight': 11,
      \ 'source_names': 'short',
      \ 'direction': 'botright',
      \ 'highlight_filter_background': 'CursorLine',
      \ 'highlight_matched_char': 'Type',
      \ 'reversed': 'true',
      \ }
call denite#custom#option('default', s:denite_options)

" temporary fix for devicons (deprecated sources):
call denite#custom#source('file,file/rec,file/mru,file/old,file/point,file/rec/git',
    \ 'converters', ['devicons_denite_converter'])

call denite#custom#source('file', 'matchers', [
        \ 'matcher/hide_hidden_files',
        \ 'matcher/fuzzy',
        \ 'matcher/project_files',
    \])
call denite#custom#source('file/rec', 'matchers', [
        \ 'matcher/hide_hidden_files',
        \ 'matcher/fuzzy',
        \ 'matcher/project_files'
    \])

call denite#custom#source('directory_rec', 'matchers', [
        \ 'matcher/hide_hidden_files',
        \ 'matcher/fuzzy',
        \ 'matcher/project_files'
    \])

call denite#custom#source('file/rec', 'sorters', [ 'sorter/rank' ])
call denite#custom#source('directory_rec', 'sorters', [ 'sorter/rank' ])
call denite#custom#source('file_mru', 'sorters', [ 'sorter/sublime' ])
call denite#custom#source( 'grep', 'matchers', [ 'matcher_regexp' ])

" Denite for git
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Denite for git dotfiles, bare repository
call denite#custom#alias('source', 'file/rec/git-dotfiles', 'file/rec')
call denite#custom#var('file/rec/git-dotfiles', 'command', [
    \ 'git', '--git-dir=' . $DOTFILES_REPOSITORY, '--work-tree=' . $HOME,
    \ 'ls-files', '-c', '--exclude-standard'])

" Ag command on grep source
if (executable('ag'))
    call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif
