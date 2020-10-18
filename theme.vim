"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim theming
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont="Fira Code 12"
set background=dark

" avoid theme issues in tty
if $TERM != 'linux'
    set termguicolors
endif

try
    " First try to load a local theme
    execute "source " . g:vimpath . "theme.local.vim"
catch
    " Default to neosolarized
    let g:neosolarized_bold = 1
    let g:neosolarized_underline = 1
    let g:neosolarized_italic = 1
    colorscheme NeoSolarized
endtry

