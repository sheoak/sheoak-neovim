""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has("autocmd")
    set autoindent
    finish
endif

" File type detection
augroup fileDetect
    au!

    au BufEnter *.zsh-theme setlocal filetype=zsh
    au BufEnter .jshintrc   setlocal filetype=json
    au BufEnter *mutt-*     setlocal filetype=mail
    au BufEnter Makefile    setlocal noexpandtab

    " open special files in vim, like annoying docx or rtf…
    autocmd BufReadPre *.docx       silent set ro
    " autocmd BufEnter *.docx silent set modifiable
    autocmd BufReadPost *.docx      silent %!pandoc --columns=78 "%" -f docx -t markdown "%" -d /dev/stdout
    autocmd BufReadPost *.odp,*.odt silent %!pandoc --columns=78 "%" -t markdown -o /dev/stdout
    autocmd BufReadPre *.doc        silent set ro
    autocmd BufReadPost *.doc       silent %!antiword "%"
    " Read-only rtf through unrtf
    autocmd BufReadPre *.rtf        silent set ro
    autocmd BufReadPost *.rtf       silent %!unrtf --text
    " Read-only pdf through pdftotext
    autocmd BufReadPre *.pdf        silent set ro
    autocmd BufReadPost *.pdf       silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

    " Special settings for passwords files
    au BufEnter /dev/shm/*  setlocal nobackup noswapfile noundofile

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    " From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
    au BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$")
        \ | exe "silent! normal g`\"za" |
    \ endif

augroup END
" }}}

" File type settings {{{
augroup fileTypes
    au!

    " Tab settings
    au FileType sass,pug,html,yaml setlocal sts=2 sw=2 ts=2

    " HTML/CSS mapping
    au FileType html,css,scss,sass EmmetInstall
    au FileType html,css,sass,less
        \ imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

    au FileType vue setlocal commentstring=//\ %s

    " omnifunc by types
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
    au FileType java          setlocal omnifunc=javacomplete#Complete
    au FileType javascript    setlocal formatprg=prettier\ --stdin

    " formating by types
    au FileType text          setlocal tw=78 fo+=t cole=0
    au FileType markdown      setlocal tw=80 fo+=t cole=0
    au FileType gitcommit     setlocal tw=72 fo+=t cc=72
    au FileType mail          setlocal tw=72 fo+=o listchars=tab:\ \

    " disable deoplete auto-complete for text files
    " au FileType text,markdown,mail
    "         \ call deoplete#custom#buffer_option('auto_complete', v:false)
augroup END

" Spell configuration
if has("spell")
    augroup spell
        au!
        au FileType text,mail,markdown,gitcommit setlocal spell spl=en,fr
        au FileType help setlocal nospell
    augroup END
end
