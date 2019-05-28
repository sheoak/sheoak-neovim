""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
" mappings are in mapping.vim
"
" Some plugin may not be installed, but I keep the settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Neovim
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-y>'

" ALE
let g:ale_fixers = ['prettier', 'stylelint', 'eslint', 'autopep8', 'yapf',
            \   'remove_trailing_lines', 'trim_whitespace' ]
let b:ale_warn_about_trailing_whitespace = 0

" vim-rooter
let g:rooter_patterns = ['Rakefile', '.git/', 'package.json', '.projectroot']
let g:rooter_silent_chdir = 1

" vim-airline
set laststatus=2 " Always display the statusline in all windows
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t' " just show filename

" Gruvbox theme
let g:gruvbox_contrast_light = 'dark'

" vim-jedi
" let g:ycm_min_num_of_chars_for_completion = 2

" vim-template
" Try to get email and name from git
let g:email=system("echo -n `git config --list | grep user.email | head -n 1 | cut -d'=' -f2`")
let g:username=system("echo -n `git config --list | grep user.name | cut -d'=' -f2`")

let g:snips_author = username . "<" . email . ">"

" vim-pandoc
let g:pandoc#biblio#sources = 'b'

" Sneak
let g:sneak#label = 0
let g:sneak#use_ic_scs = 1

" Gundo
let g:gundo_prefer_python3 = 1

" Bepoptimist
let g:bim_map_fugitive = 1
let g:surround_no_mappings = 1

" Deoplete
let g:python_host_prog=expand('~/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog=expand('~/.virtualenvs/neovim3/bin/python')
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_delay = 100

" Goyo
let g:goyo_height='90%'
let g:goyo_width=80
let g:goyo_linenr=1

" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Neosnippets
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippet'

let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['python'] = 'python,django'

" EasyAlign
" Defined in bepoptimist

" Gutentag
let g:gutentags_ctags_tagfile=".ctags"

" vim-markdown
let g:mkdp_browser = 'qutebrowser'

" Git-gutter
set updatetime=100

" Table-mode
let g:table_mode_map_prefix = ',\'

" Grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'text' : 0
            \ }
let g:grammarous#use_vim_spelllang = 1

" Devicons
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Sneak
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
let g:sneak#target_labels = "auiectsrnovdl"
let g:sneak#prompt = '❯'

" Startify
let g:bookmark_auto_save_file = $DOTFILES_PRIVATE . '/nvim/vim-bookmarks'

" bexec
let g:bexec_no_mappings = 1

" bclose
let g:bclose_no_plugin_maps = 1

" nvim-gdb
let g:nvimgdb_disable_start_keymaps = 1

" viewdoc
let g:no_viewdoc_maps = 1

" let g:no_viewdoc_abbrev = 1
let g:viewdoc_openempty = 0

" vim-multiple-cursors
let g:multi_cursor_start_word_key      = '<C-h>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-h>'
let g:multi_cursor_select_all_key      = 'g<A-h>'
let g:multi_cursor_next_key            = '<C-h>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Ternjs
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'vue',
                \ ]
