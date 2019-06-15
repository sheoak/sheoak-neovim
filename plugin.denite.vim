
if (!exists("g:plugs['denite.nvim']"))
    finish
endif

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> T denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> h denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <nowait> <silent><buffer><expr> y denite#do_map('do_action', 'yank')
    nnoremap <silent><buffer><expr> c denite#do_map('do_action', 'cd')
    nnoremap <silent><buffer><expr> e denite#do_map('do_action', 'edit')
    nnoremap <nowait> <silent><buffer><expr> o denite#do_map('do_action', 'drop')
    nnoremap <silent><buffer><expr> V denite#do_map('toggle_select')
    nnoremap <silent><buffer><expr> <space> denite#do_map('toggle_select').'j'

    nnoremap <silent><buffer> t h
    nnoremap <silent><buffer> s j
    nnoremap <silent><buffer> r k
    nnoremap <silent><buffer> n l

endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-g> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
    inoremap <silent><buffer><expr> <c-t> denite#do_map('do_action', 'tabopen')
    inoremap <silent><buffer><expr> <c-v> denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <c-h> denite#do_map('do_action', 'split')
    inoremap <silent><buffer><expr> <c-o> denite#do_map('do_action', 'drop')
    inoremap <silent><buffer><expr> <esc> denite#do_map('quit')
    " for compatibility with FZF
    inoremap <silent><buffer> <C-n> <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-p> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
    " easier than n/p
    inoremap <silent><buffer> <C-r> <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-s> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

let s:denite_options = {
      \ 'prompt' : '❯',
      \ 'split': 'floating',
      \ 'start_filter': 1,
      \ 'auto_resize': 1,
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

