""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
" mappings are in mapping.vim
"
" Some plugin may not be installed, but I keep the settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python configuration (neovim 2 & 3 virtualenv must be created)
let g:python_host_prog=expand('~/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog=expand('~/.virtualenvs/neovim3/bin/python')

" Emmet
let g:user_emmet_install_global = 0

" ALE
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace', 'stylelint'],
" \   'python': ['autopep8', 'yapf'],
" \   'javascript': ['eslint'],
" \   'vue': ['eslint']
" \}
" let g:ale_warn_about_trailing_whitespace = 0
" let g:ale_linters = {
" \   '*': ['eslint']
" \ }

" vim-rooter
let g:rooter_patterns = ['Rakefile', '.git/', 'package.json', '.projectroot']

" vim-airline
set laststatus=2 " Always display the statusline in all windows
set noshowmode   " Remove the duplicated mode label

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t' " just show filename
let g:airline#extensions#tabline#fnamecollapse = 0
" syntax not 100% correct, but faster, refresh with :AirlineRefresh :
let g:airline_highlighting_cache = 1
" do not show default correct utf-8 unix status
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" solarized-airline
let g:airline_solarized_dark_text = 1
let g:airline_solarized_dark_inactive_border = 1

if $TERM == 'linux'
  " tty
  let g:airline_solarized_normal_green = 1
  let g:solarized_base16 = 1
else
  " non-tty, add nerd font icons
  let g:airline#extensions#obsession#indicator_text = ''
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'c'  : ' command',
        \ 'i'  : ' insert',
        \ 'ic' : ' insert',
        \ 'ix' : ' insert',
        \ 'n'  : ' normal',
        \ 'ni' : ' normal',
        \ 'no' : ' normal',
        \ 'R'  : '﯒ replace',
        \ 'Rv' : '﯒ replace',
        \ 's'  : ' select',
        \ 'S'  : ' select',
        \ '' : ' select',
        \ 't'  : ' terminal',
        \ 'v'  : ' visual',
        \ 'V'  : ' visual Line',
        \ '' : ' visual Block',
  \ }

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  let g:airline_symbols.readonly = ""
  let g:airline_symbols.spell = '暈'
  let g:airline_symbols.paste = ''
endif

" theme gruvbox
" let g:gruvbox_contrast_light = 'light'

" vim-template
" Try to get email and name from git
let g:email=system("echo -n `git config --list | grep user.email | head -n 1 | cut -d'=' -f2`")
let g:username=system("echo -n `git config --list | grep user.name | cut -d'=' -f2`")

let g:snips_author = username . "<" . email . ">"

" vim-pandoc
let g:pandoc#biblio#sources = 'b'

" Gundo
let g:gundo_prefer_python3 = 1

" Deoplete
" let g:deoplete#enable_at_startup = 1
" let g:neosnippet#enable_completed_snippet = 1
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'

" Goyo
let g:goyo_height='98%'
let g:goyo_width=80
let g:goyo_linenr=1

" Ranger
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Neosnippets
" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippet'

" let g:neosnippet#scope_aliases = {}
" let g:neosnippet#scope_aliases['python'] = 'python,django'

" Gutentag
let g:gutentags_ctags_tagfile=".ctags"
let g:gutentags_exclude_project_root=['/etc']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.svn', '.project', 'package.json' ]
let g:gutentags_file_list_command = {
      \  'markers': {
      \  '.git': 'git ls-files'
      \  }
    \  }
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase',
      \ 'gitsendemail', 'git']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]

" vim-markdown
let g:mkdp_browser = 'firefox'

" Git-gutter
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0

" Grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'text' : 0
            \ }
let g:grammarous#use_vim_spelllang = 1

" Devicons
" let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Sneak
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
let g:sneak#prompt = '❯'
let g:sneak#label = 0

" Startify
let g:bookmark_auto_save_file = $DOTFILES_PRIVATE . '/nvim/vim-bookmarks'
let g:startify_custom_header = []

" Ternjs
" let g:deoplete#sources#ternjs#filetypes = ['jsx', 'vue']

" vim-unimpaired-extras
" if (executable('ag'))
"     let g:unimpaired_extra_denite_cmd_hidden = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
"     let g:unimpaired_extra_denite_cmd = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
" endif

" Ansible
let g:ansible_unindent_after_newline = 1

" vim-virtualenv
let g:virtualenv_auto_activate = 1
let g:virtualenv_directory = "$HOME/.virtualenvs"

" vCoolor.vim
let g:vcoolor_disable_mappings = 1

" thesaurus_query
" undocumented option to remove mappings
let g:tq_map_keys = 0

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
let g:prettier#config#config_precedence = 'file-override'
"let g:prettier#config#semi = 'false'

" coc
let g:coc_node_path = "/usr/bin/node"

