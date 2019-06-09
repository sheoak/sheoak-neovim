""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings
" See bepotimist for homerow related mappings (tsrn)
"
" TODO: find a key and remap mkdx https://github.com/SidOfc/mkdx
"       candidate are È ù œ (if moving tab)
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
" Plugin pre-configuration for bepotimist
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
" hack for sneak, to avoid remapping
nmap , <Nop>

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Completion (<tab>, <c-space>)
" -----------------------------------------------------------------------------

" Neosnippets
imap <C-space> <Plug>(neosnippet_expand_or_jump)
smap <C-space> <Plug>(neosnippet_expand_or_jump)
xmap <C-space> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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


" Executing
" -----------------------------------------------------------------------------

nmap <leader>p <Nop>
nmap <leader>s <Nop>
" ALE
nmap <leader>af <Plug>(ale_fix)
nmap <leader>ad <Plug>(ale_detail)
" Bexec
vmap <leader>x :call bexec#Visual()<CR>
nmap <leader>x :call bexec#Normal()<CR>
nmap <leader>l :call bexec#Live()<CR>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pU :PlugUpgrade<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>ps :PlugStatus<CR>
nmap <leader>pd :PlugDiff<CR>
nmap <leader>pI :w<CR>:source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>
nmap <leader>m :make<CR>
nmap <leader>tt :!tox<CR>
nmap <leader>tp :!pytest<CR>
" Order all css properties
nnoremap <leader>c :<C-u>g/{/ .+1,/}/-1 sort<CR>

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
nnoremap <leader>do :DiffOrig<CR>
" Clean dirty white space (EOL)
nnoremap <leader><space> :silent! %s/\s\+$//<CR>

" Forgotten unbreakable spaces… for French only
" TODO: operator cleaner?
nnoremap <leader>  :%s/\(\S\) \([:;?!]\)/\1 \2/g<CR>

" Misc.
" -----------------------------------------------------------------------------

" vim-bookmarks
nnoremap ms <Plug>BookmarkShowAll
