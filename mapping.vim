""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings
" See bepotimist for homerow related mappings (tsrn)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ----------------------------------------------------------------------------
" Neovim built-in
" ----------------------------------------------------------------------------
" Don't use Ex mode, use Q for formatting
noremap Q gq
" don't override register when pasting over
xnoremap p pgvy
" page up/down
noremap <BS> <PageUp>
noremap <Space> <PageDown>
" terminal escape instead of C-\ C-n
tnoremap <C-g> <C-\><C-n>

" ----------------------------------------------------------------------------
" Plugin pre-configuration for bepoptimist
" It needs to be in the main configuration because of loading priorities
" ----------------------------------------------------------------------------
let g:surround_no_mappings = 1
let g:ranger_map_keys = 0
let g:bexec_no_mappings = 1
let g:bclose_no_plugin_maps = 1
let g:nvimgdb_disable_start_keymaps = 1
let g:user_emmet_leader_key='<C-y>'
let g:jedi#documentation_command = 'gh'   " vim Jedi needs to use the same key
let g:jedi#completions_command = ""
let g:jedi#rename_command = ''
let g:jedi#usages_command = ''
let g:jedi#goto_assignments_command = ''
let g:jedi#goto_command = ''
let g:table_mode_map_prefix = ',\|'
let g:sneak#target_labels = "auiectsrnovdl"
" let deoplete handle jedi
let g:jedi#completions_enabled = 0
" hack for sneak, to avoid remapping
nmap , <Nop>

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Completion (<tab>, <c-space>)
" -----------------------------------------------------------------------------

" Neosnippets
" imap <C-space> <Plug>(neosnippet_expand_or_jump)
" smap <C-space> <Plug>(neosnippet_expand_or_jump)
" xmap <C-space> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ neosnippet#expandable_or_jumpable() ?
"  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"  Formatting
" -----------------------------------------------------------------------------

" Overwrite the default action for toggling quickfix
nnoremap <silent> màI :call mkdx#fzfQuickfixHeaders()<CR>

" Insert mode mapping for completion

" Rewrite some vim maps in insert mode, not that usefull anyway if you know 
" how to use vim in normal mode properly:
inoremap <C-j> <C-x><C-]>
inoremap <C-o> <C-x><C-o>

imap <c-k> <plug>(fzf-complete-word)
imap <c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-f> fzf#vim#complete#path('ag --hidden -l -g ""')

" Global line completion (not just open buffers. ripgrep required.)
" TODO: add with ,l and ,L in normal mode
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))


" Executing (mostly leader key)
" -----------------------------------------------------------------------------
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

" ALE
" nmap <leader>ad <Plug>(ale_detail)
" nmap <leader>af <Plug>(ale_fix)
" css colors insert/convert via plugins
nmap <leader>cA :ConvertColorTo rgba<CR>
nmap <leader>ca :VCoolIns ra<CR>
nmap <leader>cH :ConvertColorTo hex<CR>
nmap <leader>ch :VCoolor<CR>
nmap <leader>cR :ConvertColorTo rgb<CR>
nmap <leader>cr :VCoolIns r<CR>
nnoremap <leader>do :DiffOrig<CR>
" Order all css properties
nnoremap <leader>cs :<C-u>g/{/ .+1,/}/-1 sort<CR>
" nmap <leader>f :Prettier<CR>
nmap <leader>m :make<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>pd :PlugDiff<CR>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pI :w<CR>:source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>
nmap <leader>p <Nop>
nmap <leader>ps :PlugStatus<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pU :PlugUpgrade<CR>
nmap <leader>s <Nop>
nmap <leader>tp :!pytest<CR>
nmap <leader>tt :!tox<CR>
" Bexec
nmap <leader>X :call bexec#Live()<CR>
nmap <leader>x :call bexec#Normal()<CR>
vmap <leader>x :call bexec#Visual()<CR>
" Clean dirty white space (EOL)
nnoremap <leader><space> :silent! %s/\s\+$//<CR>
" Forgotten unbreakable spaces… for French only
" TODO: operator cleaner?
nnoremap <leader>  :%s/\(\S\) \([:;?!]\)/\1 \2/g<CR>

" Misc.
" -----------------------------------------------------------------------------

" vim-bookmarks
nnoremap ms <Plug>BookmarkShowAll

" Experiment
" Repeat on all selected lines
vmap . :normal .
" shortcut to @: for bepo
map @. @:
" select last paste in visual mode
" https://dalibornasevic.com/posts/43-12-vim-tips
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" to match C and D behavior
nnoremap Y y$

" pytest
nnoremap ,tt :Pytest function<CR>
nnoremap ,tf :Pytest file<CR>
nnoremap ,tp :Pytest project<CR>
nnoremap ,ts :Pytest session<CR>
nnoremap ,tx :Pytest fails<CR>
nnoremap ,te :Pytest error<CR>
nnoremap ,td :Pytest file --pdb<CR>
nnoremap ,tB :Pytest file -s<CR>
nnoremap ,tb opytest.set_trace()<ESC>

" pdb
nnoremap ,g :GdbStartPDB python -m pdb app.py<CR>

" vim-which-key
" https://github.com/liuchengxu/vim-which-key
" let g:mapleader = "\,"
" let g:maplocalleader = '\\'
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap ,<CR> :term<CR>

" startify
nnoremap ;; :Startify<CR>
nnoremap ,p <Nop>
nnoremap ,ps :SSave<CR>
nnoremap ,pc :SClose<CR>
nnoremap ,pd :SDelete<CR>
nnoremap ,pl :SLoad<CR>

" startify example:
" nnoremap ,pb :SLoad mysession<CR>
