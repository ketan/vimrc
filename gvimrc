if has("gui_macvim")
  set guifont=Monaco:h14      " fonts for macvim
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu File.New\ Tab key=<nop>
  nmap <D-t> :CommandTFlush<CR>:CommandT<CR>
  imap <D-t> <ESC>:CommandTFlush<CR>:CommandT<CR>

  "CMD+SHIFT+T to open tagbar
  macmenu File.Open\ Tab\.\.\. key=<nop>
  map <D-T> :TagbarOpen<CR>/
  imap <D-T> <ESC><D-T>

  "Run tests Ruby/Rails
  "All tests: CMD-R
  autocmd User Rails imap <D-r> <ESC>:Rake<CR>
  autocmd User Rails nmap <D-r> :Rake<CR>

  "Single test: CMD+SHIFT+R
  autocmd User Rails imap <D-R> <ESC>:.Rake"<CR>
  autocmd User Rails nmap <D-R> :.Rake"<CR>


  set guioptions-=LlRrb " don't show any scrollbars, yeah it's a bug
  set guioptions-=LlRrb " don't show any scrollbars, yeah it's a bug

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack <C-R>=expand("<cword>")<CR>
  vmap <D-F> :Ack <C-R>=expand("<cword>")<CR>

  hi NonText guifg=gray30 guibg=black " overrider stuff from gvimrc

  " map <D-e> :call StartTerm()<CR> " Command-e for ConqueTerm

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle
  imap <D-/> <Esc><D-/>i

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

  " switch to previous tab using CMD-0
  let g:lasttab = 1
  nmap <D-0> :exe "tabn ".g:lasttab<CR>
  au TabLeave * let g:lasttab = tabpagenr()

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h
else
  " Ctrl-T for Command-T
  map <C-t> :CommandT<CR>
  imap <C-t> <Esc>:CommandT<CR>

  " Ctrl-Shift-F for Ack
  map <C-F> :Ack<space>

  " Ctrl-e for ConqueTerm
  map <C-e> :call StartTerm()<CR>

  " Alt-][ to increase/decrease indentation
  vmap <A-]> >gv
  vmap <A-[> <gv

  " Ctrl-Option-ArrowKey to switch viewports
  map <C-S-Up> <C-w>k
  imap <C-S-Up> <Esc> <C-w>k
  map <C-S-Down> <C-w>j
  imap <C-S-Down> <Esc> <C-w>j
  map <C-S-Right> <C-w>l
  imap <C-S-Right> <Esc> <C-w>l
  map <C-S-Left> <C-w>h
  imap <C-S-Left> <C-w>h
endif

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Don't beep
" set visualbell

" Start without the toolbar
set guioptions-=T

" Default gui color scheme
color ir_black

" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \
endfunction

"Reload .gvimrc when saved
autocmd BufWritePost .vimrc source %
autocmd BufWritePost .vimrc source ~/.gvimrc
autocmd BufWritePost .gvimrc source %

