""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extended settings for vim
"
" This configuration only contains personnal settings like custom paths,
" themes, fonts…
"
" see plugin vim-sheoak-base-settings for base settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" default leader is bad in azerty and bépo keyboards
" vim-bepoptimist plugin will take care of moving , and ;
" we mainly use it as "execute prefix, see mapping.vim.
let mapleader = ";"

" you need to create backups and undo directory
" XDG_DATA_HOME may not be defined so we use home
" the last // will add the absolute path to the file
set backupdir=$HOME/.local/share/nvim/backups,$HOME/.backups/,/tmp/
set directory=$HOME/.local/share/nvim/swap//,$HOME/.backups//,/tmp//
set backupskip=/tmp/*,$HOME/backups/*,*.tmp/*,*.cache/*

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
    set undodir=$HOME/.local/share/nvim/undo//,$HOME/.backups/undo//,/tmp/undo//
endif

if has("gui_running")
    set background=light
    set guifont="Fira Code 12"
else
    set background=dark
endif

if $TERM == 'linux'
    colorscheme Tomorrow-Night-Eighties
else
    try
        colorscheme Tomorrow-Night-Eighties
    catch
        colorscheme desert
    endtry
endif
