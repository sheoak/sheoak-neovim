" ----------------------------------------------------------------------------
" vim-airline settings
" see also after/plugin/airline.vim
" ----------------------------------------------------------------------------
set laststatus=2 " Always display the statusline in all windows

" vars
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

" coc
" let airline#extensions#coc#error_symbol = 'E:'
" let airline#extensions#coc#warning_symbol = 'W:'
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline#extensions#coc#enabled ='0'

if $TERM == 'linux'
  " tty
  let g:airline_solarized_normal_green = 1
  let g:solarized_base16 = 1
else
  " non-tty, add nerd font icons
  let g:airline#extensions#obsession#indicator_text = ''
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'c'  : '',
        \ 'i'  : '',
        \ 'ic' : '',
        \ 'ix' : '',
        \ 'n'  : '',
        \ 'ni' : '',
        \ 'no' : '',
        \ 'R'  : '﯒',
        \ 'Rv' : '﯒',
        \ 's'  : '',
        \ 'S'  : '',
        \ '' : '',
        \ 't'  : ' terminal',
        \ 'v'  : '',
        \ 'V'  : '',
        \ '' : '',
  \ }

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  let g:airline_symbols.readonly = ""
  let g:airline_symbols.spell = '暈'
  let g:airline_symbols.paste = ''
  let g:airline_symbols.dirty=' '
endif

let g:airline#extensions#branch#vcs_checks = ['untracked', 'dirty']
