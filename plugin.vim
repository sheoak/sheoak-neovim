"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loading plugin via vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ----------------------------------------------------------------------------
" Under testing …
" ----------------------------------------------------------------------------
Plug 'chrisbra/csv.vim'
Plug 'SidOfc/mkdx'                     " Markdown goodies
Plug 'sheoak/vim-snippets'             " Snippets for different languages

" ----------------------------------------------------------------------------
" My custom plugins
" ----------------------------------------------------------------------------
Plug 'sheoak/vim-sheoak-base-settings' " Base vim settings
Plug 'sheoak/vim-bepoptimist'          " Bepo keymap
Plug 'sheoak/vim-unimpaired-extras'    " Additionnal vim-unimpaired mappings

" ----------------------------------------------------------------------------
" Git plugins
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'              " Git integration
Plug 'junkblocker/git-time-lapse'      " Git history
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'          " Git gutter on the left

" ----------------------------------------------------------------------------
" Motions and text objects
" ----------------------------------------------------------------------------
Plug 'tpope/vim-surround'              " Motions around words
Plug 'justinmk/vim-sneak'              " Multiline f/F/t/T
Plug 'wellle/targets.vim'              " Additionnal text objects: cin) or da,…
Plug 'bkad/CamelCaseMotion'            " Additionnal CamelCase motions
Plug 'michaeljsmith/vim-indent-object' " Indentation text objects
Plug 'jeetsukumaran/vim-pythonsense'   " Additionnal python text-objects
Plug 'PeterRincker/vim-argumentative'  " Switch arguments

" ----------------------------------------------------------------------------
" File explorer
" ----------------------------------------------------------------------------
Plug 'tpope/vim-vinegar'               " Clean :Ex
Plug 'rbgrouleff/bclose.vim'           " Ranger plugin dependency
Plug 'francoiscabrol/ranger.vim'       " Ranger integration

" ----------------------------------------------------------------------------
" Better mappings and settings
" ----------------------------------------------------------------------------
Plug 'tpope/vim-repeat'                " Missing repeat with dot
Plug 'tpope/vim-speeddating'           " Inc/dec dates and numbers
Plug 'tpope/vim-commentary'            " Quick comment
Plug 'tpope/vim-unimpaired'            " Pairing mapping
Plug 'tpope/vim-sleuth'                " Detect tab settings

" ----------------------------------------------------------------------------
" Formating
" ----------------------------------------------------------------------------
Plug 'junegunn/vim-easy-align'         " Align tabs
Plug 'dhruvasagar/vim-table-mode'      " Make table easily

" ----------------------------------------------------------------------------
" Language
" ----------------------------------------------------------------------------
Plug 'Ron89/thesaurus_query.vim'       " Synonyms
Plug 'kana/vim-operator-user'          " Grammarous dep
Plug 'rhysd/vim-grammarous'            " Grammar check

" ----------------------------------------------------------------------------
" Testing
" ----------------------------------------------------------------------------
Plug 'sakhnik/nvim-gdb',               " A debugger that actually works
Plug 'alfredodeza/pytest.vim'          " Pytest integration

" ----------------------------------------------------------------------------
" Templates and snippets
" ----------------------------------------------------------------------------
Plug 'aperezdc/vim-template'           " Auto-template when opening new file

" ----------------------------------------------------------------------------
" IDE
" ----------------------------------------------------------------------------
Plug 'mhinz/vim-startify'              " Startup screen
Plug 'junegunn/fzf.vim'                " fuzzy find wrapper
Plug 'ludovicchabant/vim-gutentags'    " Ctags generation
Plug 'airblade/vim-rooter'             " Auto cd to project dir
Plug 'diepm/vim-rest-console'          " Call REST API from vim
Plug 'editorconfig/editorconfig-vim'   " Read editorconfig file
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clojure-vim/async-clj-omni'      " Coc async omni-completion
Plug 'fboender/bexec'                  " Execute current script
Plug 'osyo-manga/vim-over'             " Live matching on command line
Plug 'sjl/gundo.vim'                   " More undo
Plug 'junegunn/vim-peekaboo'           " Preview register list
Plug 'MattesGroeger/vim-bookmarks'     " Annotations

" ----------------------------------------------------------------------------
" Filetype specific plugins
" ----------------------------------------------------------------------------
" Python
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }

" Web
Plug 'alvan/vim-closetag',     { 'for': ['html','css', 'scss', 'sass'] }
Plug 'tmhedberg/matchit',      { 'for': ['html', 'xml'] }
Plug 'digitaltoad/vim-pug',    { 'for': ['vue', 'pug'] }
Plug 'posva/vim-vue',          { 'for': ['js', 'vue'] }
Plug 'KabbAmine/vCoolor.vim'   " color picker
Plug 'amadeus/vim-convert-color-to'
Plug 'mattn/emmet-vim'

" Javascript
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'elzr/vim-json',                { 'for': 'json' }

" System
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'neomutt/neomutt.vim'

" Text files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" vim plugins
Plug 'tpope/vim-scriptease'            " For writing plugins

" ----------------------------------------------------------------------------
" Themes and styling
" ----------------------------------------------------------------------------
Plug 'junegunn/goyo.vim'               " Minimalist interface on demand
Plug 'iCyMind/NeoSolarized'
Plug 'cormacrelf/vim-colors-github'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/vim-emoji'
Plug 'vim-airline/vim-airline'         " Cool status bar
Plug 'vim-airline/vim-airline-themes'  " Airline themes
" After - plugins that must be loaded last
Plug 'ryanoasis/vim-devicons'          " icons, must be loaded after the rest
