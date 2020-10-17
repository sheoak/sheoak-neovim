""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvimpager main configuration file
"
" Maintainer: sheoak <contact [at] lightn.es>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exe "set runtimepath+=" . expand($HOME . "/.local/share/nvim/site/")

let s:vimpath = "~/.config/nvim/"
let s:plug_path=$HOME . '/.local/share/nvim/plugged'

call plug#begin(s:plug_path)
    execute "source " . s:vimpath . "plugin.pager.vim"
call plug#end()

execute "source " . s:vimpath . "setting.vim"

nnoremap q :q!<CR>
