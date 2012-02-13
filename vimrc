call pathogen#infect()

" This is likely a bludgeon to solve some other issue, but it works
" Without setting this, ZoomWin restores windows in a way that causes
" automatically reload files changed outside of vim
" display EOL character
" enhanced mode command line completion
" equalalways behavior to be triggered the next time CommandT is used.
" helptags ~/.vim/doc    " add local help!
" persistent undo
" press f2 to disable all smartness when pasting
" set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<   " Show $ at end of line and trailing space as ~
" set list
" the color of the EOL character

color desert " Default color scheme
color vividchalk  " the colortheme


set autoindent              " copy indent from current line when starting a new line
set autoread                " autoload a file that has changed outside of vim
set autowriteall            " write all files when navigating away to a different file/buffer/exec
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backupdir=~/.vim/backup " Directories for backup files
set cindent                 " C style indenting
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case   " indent on these keywords
set clipboard+=unnamed      " Yanks go on clipboard instead.
set confirm                 " Use dialogs for confirmation
set directory=~/.vim/backup " Directories for swp files
set encoding=utf-8          " use utf-8 by default
set expandtab               " <tab> inserts a space
set exrc                    " enable per-directory .vimrc files
set formatoptions=tcq
set history=10000           " Number of things to remember in history.
set hlsearch                "enable highlight search
set ignorecase              " ignore case in search
set incsearch               " do incremental searching
set laststatus=2            " Always show status line.
set list listchars=eol:¬,tab:··,trail:·   " display characters for EOL, tabs and trailing whitespaces
hi NonText guifg=gray30 guibg=black

set matchtime=5           " Bracket blinking in tenths of seconds
set modeline
set modelines=10
set mouse=a               " Mouse in all modes
set mousehide             " Hide mouse after chars typed
set nobackup              " keep a backup file
set nocompatible          " not compatible with vim
set nocp incsearch
set noequalalways         " all split windows are not same size
set noerrorbells          " No noise.
set novisualbell          " No blinking .
set nowrap                " Line wrapping off
set number                " Line numbers on
set pastetoggle=<F2>
set ruler                 " Show line, column in statusbar
set scrolloff=2           " Number of lines above or below cursor when scrolling
set shiftwidth=2          " Number of spaces for each autoindent
set showcmd               " Show (partial) command in the status line
set showmatch             " Show matching brackets.
set smartcase             " overwride ignorecase if search pattern contains uppercase
set smarttab              " tabs in front of a line indents it
set softtabstop=2         " Use 2 spaces instead of instead of tabs
set statusline=%{fugitive#statusline()}\ <%F%h%m%r%h%w%y\ %{&ff}\ %{exists('g:loaded_rvm')?rvm#statusline():''}%=\ %l:%c%V\ %L\ %P
set t_Co=256              " use 256 colors, always!
set t_vb=                 " disable terminal bell
set tabstop=2             " Tabs are 2 spaces
set timeoutlen=1000       " set the key delay when using shortcuts
set undodir=~/.vim/backup " Save undo files here
set undofile              " Automatically save undo history of a file
set viminfo^=!            " Add recently accessed projects menu (project plugin)
set visualbell            " don't beep, use a visual bell instead
set wildignore+=*.bak
set wildignore+=*.class,*.o,*.obj,*.rbc
set wildignore+=*.gem,vendor/jruby/*,vendor/twist*,vendor/**/*_spec.rb,vendor/**/*_test.rb,reports/*,vendor/jruby/*,vendor/java/*,vendor/twist-libs/*,vendor/twist-test-libs/*,vendor/gems/*
set wildignore+=*.log,log/*
set wildignore+=*.tmp,tmp/*
set wildignore+=.git,.svn,.hg
set wildmenu              " enhanced command line completion
set wildmode=list:longest,list:full " Tab completion

syntax on               "enable syntax highlight


" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Gundo configuration
nmap <F5> :GundoToggle<CR>
imap <F5> <ESC>:GundoToggle<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

map Q gq                " Don't use Ex mode, use Q for formatting

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" autocmd BufEnter * Rvm "Use rvm when entering a buffer

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

augroup __RUBY
  au!
  function! ExecuteRubyUnitTest()
    let s:line_no = search('^\s*def\s*test_', 'bcnW')
    if s:line_no
      exec '!_vim_ruby -Ilib,test % -n ' . split(getline(s:line_no))[1] . ' -v'
    else
      echo "Can't find a test!"
    endif
  endfunction
  
  " ruby shortcuts
  "  autocmd BufReadPost *.rb imap <D-r> <ESC>:w<CR>:!_vim_ruby -Ilib,test % -v<CR>
  "  autocmd BufReadPost *.rb nmap <D-r> <ESC>:w<CR>:!_vim_ruby -Ilib,test % -v<CR>

  "  autocmd BufReadPost *_test.rb imap <D-R> <ESC>:call ExecuteRubyUnitTest()<CR>
  "  autocmd BufReadPost *_test.rb nmap <D-R> <ESC>:call ExecuteRubyUnitTest()<CR>

  " automatically strip whitespace before save
  autocmd FileType ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  autocmd FileType eruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

augroup END

augroup filetypedetect
    " additional filetype when editing .<FOO>.erb
    autocmd BufRead,BufNewFile *.html.erb set filetype=eruby.html
    autocmd BufRead,BufNewFile *.js.erb set filetype=eruby.javascript
augroup end


augroup __CLOJURE
  " clojure shortcuts
  autocmd BufRead,BufNewFile *.clj imap <D-r> <ESC>:call vimclojure#EvalFile() %<CR>i
  autocmd BufRead,BufNewFile *.clj nmap <D-r> <ESC>:call vimclojure#EvalFile()<CR>

  autocmd BufRead,BufNewFile *.clj imap <D-R> <ESC>:call vimclojure#EvalToplevel() %<CR>i
  autocmd BufRead,BufNewFile *.clj nmap <D-R> <ESC>:call vimclojure#EvalToplevel()<CR>
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Navigate between windows easier
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Default to using a stack style editing (current window always max)
" set winminheight=0
" au VimEnter * set winheight=999
" set splitbelow

nmap <silent> <C-N><C-N> :set invnumber<CR>
nmap <silent> <C-W><C-W> :set invwrap<CR>
nmap <silent> <C-G><C-G> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
nmap <silent> <C-Z><C-Z> :let &foldcolumn = ( &foldcolumn == 0 ? 5 : 0 )<CR>

" Change from using stack style editing to normal, equal sized windows and back
nmap <silent> <C-S> :let &winheight = ( &winheight == 999 ? 1 : 999)<CR><C-W>=

" Open/close folds with space
nmap <Space> za

" Easier interaction with clipboard
"vmap <Leader>y "+y
"nmap <Leader>p "+gP
vmap ,y "+y
nmap ,p "+gP

" Select some text and search with it
vmap // y/<C-R>"<CR>
vmap ?? y?<C-R>"<CR>

" Wrapped line movement
map <Up> gk
map <Down> gj

" Goto file in another window and navigate back to this window
nmap <M-F><M-T> <C-W><C-F><C-K>

" Execute macro in the 'q' register.
map <C-Q> @q

" More useful mappings to find the latest { or }
nmap [[ [{
nmap ]] ]}

let Tlist_Close_On_Select=1


filetype plugin on

let html_use_css = 1
let g:lisp_rainbow = 1

" let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "/Users/ketanpadegaonkar/bin/ng"
let vimclojure#SplitPos = 'bottom'
let vimclojure#SplitSize = 10

let g:xml_syntax_folding=1

" Use man in a new window
runtime! ftplugin/man.vim
nmap K <Leader>K
vmap K "my:Man <C-R>m<CR>

" Change directory of the current buffer to be the same as the file
command! -n=0 Cdl lcd %:p:h

" If forgot to edit a file with sudo
command! W w !sudo tee % > /dev/null

"No more accidently hitting <F1>
map <F1> <Nop>


" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
" enable rails menus
let g:rails_menu=2
au FileType diff color desert

"Command-T configuration
let g:CommandTMatchWindowAtTop=1
let g:CommandTAcceptSelectionMap='<M-CR>'
let g:CommandTAcceptSelectionTabMap='<CR>'

" no more :wq, just ;wq
nnoremap ; :
" Rails configuration
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
autocmd User Rails map <Leader>p :Rstep<CR>
autocmd User Rails map <Leader>sp :RSstep<CR>
autocmd User Rails map <Leader>tp :RTstep<CR>
autocmd User Rails map <Leader>m :Rmodel<CR>
autocmd User Rails map <Leader>c :Rcontroller<CR>
autocmd User Rails map <Leader>v :Rview<CR>
autocmd User Rails map <Leader>u :Runittest<CR>
autocmd User Rails map <Leader>f :Rfunctionaltest<CR>
autocmd User Rails map <Leader>i :Rintegrationtest<CR>
autocmd User Rails map <Leader>h :Rhelper<CR>
autocmd User Rails map <Leader>tm :RTmodel<CR>
autocmd User Rails map <Leader>tc :RTcontroller<CR>
autocmd User Rails map <Leader>tv :RTview<CR>
autocmd User Rails map <Leader>tu :RTunittest<CR>
autocmd User Rails map <Leader>tf :RTfunctionaltest<CR>
autocmd User Rails map <Leader>ti :RTintegrationtest<CR>
autocmd User Rails map <Leader>sm :RSmodel<CR>
autocmd User Rails map <Leader>sc :RScontroller<CR>
autocmd User Rails map <Leader>sv :RSview<CR>
autocmd User Rails map <Leader>su :RSunittest<CR>
autocmd User Rails map <Leader>sf :RSfunctionaltest<CR>
autocmd User Rails map <Leader>si :RSintegrationtest<CR>
autocmd User Rails map <Leader>g :Rconfig<CR>
autocmd User Rails map <Leader>sg :RSconfig<CR>
autocmd User Rails map <Leader>tg :RTconfig<CR>

" Emacs style ctrl-a & ctrl-e in insert mode
imap <C-a> <ESC>I
imap <C-e> <ESC>A

map <C-a> ^
map <C-e> $


" Insert New Line without going into insert mode
map <S-Enter> O<ESC> 
map <Enter> o<ESC>

" requires unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"Tagbar
let g:tagbar_autoclose = 1 "autoclose on selection

" Ignore certain patterns by defaulg

" reload vimrc when saved
autocmd BufWritePost .vimrc source %

" highlight ack search terms
let g:ackhighlight=1

" Save all buffers on losing focus
autocmd BufLeave,FocusLost * wall

" Open buffers in their own tab, breaks stuff
"autocmd BufAdd,BufNewFile * nested tab sball


" Map CTRL-] to show tag list on multiple matches and open in new tab
map <C-]> :tab split<CR>:exec("tjump ".expand("<cword>"))<CR>
imap <C-]> <ESC><C-]>

" the default disables ctags from indexing javscript!
let g:rails_ctags_arguments='--exclude="**/vendor/jruby" --exclude="**/vendor/twist-libs" --exclude="**/vendor/ruby/**/*/_test.rb" --exclude="**/vendor/ruby/**/*/_spec.rb" --exclude="**/reports*"'


" Include user's local vim config
if filereadable(expand("~/.vimrc.nerdtree"))
  source ~/.vimrc.nerdtree
endif
