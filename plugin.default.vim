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

" vim-rooter
let g:rooter_patterns = ['Rakefile', '.git/', 'package.json', '.projectroot']

" vim-template
" Try to get email and name from git
let g:email=system("echo -n `git config --list | grep user.email | head -n 1 | cut -d'=' -f2`")
let g:username=system("echo -n `git config --list | grep user.name | cut -d'=' -f2`")

let g:snips_author = username . "<" . email . ">"

" vim-pandoc
let g:pandoc#biblio#sources = 'b'

" Gundo
let g:gundo_prefer_python3 = 1

" Goyo
let g:goyo_height='98%'
let g:goyo_width=80
let g:goyo_linenr=1

" Ranger
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Gutentag
let g:gutentags_ctags_tagfile=".ctags"
let g:gutentags_exclude_project_root=['/etc']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.svn', '.project', 'package.json']
let g:gutentags_file_list_command = {
      \  'markers': {
      \  '.git': 'git ls-files'
      \  }
    \  }
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase',
      \ 'gitsendemail', 'git']

let s:cache_dir = expand('~/.local/share/gutentags/cache')
if filereadable(s:cache_dir)
  let g:gutentags_cache_dir = s:cache_dir
endif

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
let g:gitgutter_override_sign_column_highlight = 0

" Grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'text' : 0
            \ }
let g:grammarous#use_vim_spelllang = 1

" Devicons
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
let g:startify_files_number = 7
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = ['a' , 'u', 'c', 's', 'r', 'm',
    \ 'o', 'd', 'l', 'j', 'x', 'g', 'h'
\ ]

let g:startify_lists = [
      \ { 'type': 'sessions', 'header': ['   Sessions'], 'indices':
          \ ['b', 'p', 'f', 'n', 'v', 'z'] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }
\ ]

" vim-bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" Ansible
let g:ansible_unindent_after_newline = 1

" vim-virtualenv
let g:virtualenv_auto_activate = 1
let g:virtualenv_directory = "$HOME/.virtualenvs"

" vCoolor.vim
let g:vcoolor_disable_mappings = 1

" thesaurus
" undocumented option to remove mappings
let g:tq_map_keys = 0
let g:tq_language=['en', 'fr']

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
let g:prettier#config#config_precedence = 'file-override'
"let g:prettier#config#semi = 'false'

" coc
let g:coc_node_path = "/usr/bin/node"

" vim-emoji
" https://www.webfx.com/tools/emoji-cheat-sheet/
" set completefunc=emoji#complete
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = '≠'

" peekaboo
let g:peekaboo_window = "vert bo 40new"

" git-messenger
let g:git_messenger_always_into_popup = 1
let g:git_messenger_no_default_mappings = 1

" nvim-gdb
let g:nvimgdb_config_override = {
  \ 'key_next': '<return>',
  \ 'key_step': '<space>',
  \ 'key_finish': 'f',
  \ 'key_quit': 'q',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ 'key_frameup':    '<c-p>',
  \ 'key_framedown':  '<c-n>',
  \ 'key_eval':       'e',
  \ 'sign_current_line': '▶',
  \ 'sign_breakpoint': [ '●', '●²', '●³', '●⁴', '●⁵', '●⁶', '●⁷', '●⁸', '●⁹', '●ⁿ' ],
  \ }
function! NvimGdbNoTKeymaps()
  tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

" git-timelapse
nmap ’<BS> :GitTimeLapse<CR>

" semshi conflicts with coc:
let g:semshi#error_sign = v:false
