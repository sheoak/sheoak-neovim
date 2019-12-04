
if (!exists("g:plugs['denite.nvim']"))
    finish
endif

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

" Move up/down into candidate list - easier than CTRL-n/p
call denite#custom#map(
      \ 'insert',
      \ '<C-s>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-r>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
