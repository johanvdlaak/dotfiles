set nocompatible
filetype off

" Load Vundle, store bundles in ~/.vundle.local
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle
Bundle 'gmarik/Vundle.vim'

" Bling
Bundle 'bling/vim-airline'

" Useful helpers
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'align'

" TDD / BDD
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-cucumber'

" Git / Fugitive
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" Markdown
Bundle 'tpope/vim-markdown'

" Ruby / Rails
Bundle 'tpope/vim-bundler'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'mattn/zencoding-vim'
Bundle 'jgdavey/vim-blockle'
Bundle 'godlygeek/tabular'

" JS
Bundle 'kchmck/vim-coffee-script'

" CSS
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-haml'

" Ctrl-p
Bundle 'kien/ctrlp.vim'


" Done, finish up Vundle
filetype plugin indent on

" To enable vim-airline directly
set laststatus=2

if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

" Always work with utf-8
set encoding=utf-8

" Highlight the cursor line
" set cursorline
" set cursorcolumn

" Automatically update changes on getting focus
set autoread

" Keep a longer history
set history=100

" Realtime git update
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Make file/command completion useful
set wildmenu
set wildmode=list:longest
set wildignore+=tmp,.bundle,.sass-cache,.git,.svn,.hg

" Disable audible bell
set visualbell

" Set 256 color support
set t_Co=256

" Syntax highlighting
syntax on
set showmatch "matchin braces
set background=dark
" colorscheme lucius

" Replace Ruby 1.8 Hash syntax with 1.9 Hash syntax_
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>_ 

" Font see dotfiles/data
" set guifont=Menlo:h12
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12

" Intuitive backspace
set bs=indent,eol,start

" Line wrapping
set nowrap
set linebreak

" Make sure we use editor lines, not real lines when navigating
nnoremap j gj
nnoremap k gk

" Rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Default ctrl-p stuff.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Some other settings
set hidden
set modelines=0

" Status line
set showcmd
set ruler
set number

" Scrollbars
set sidescrolloff=2
set numberwidth=4

" Maintain more context around the cursor
set scrolloff=3

" Don't keep backups
set nobackup
set nowritebackup
set noswapfile

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set terminal title
set title

" Indenting
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set ai " Automatically set the indent of a new line
set si " Smart indent

" Remove trailing whitespace from code files on save
function! StripTrailingWhitespace()
  " store current cursor location
  silent exe "normal ma<CR>"
  " store the current search value
  let saved_search = @/

  " delete the whitespace (e means don't warn if pattern not found)
  %s/\s\+$//e

  " restore old cursor location
  silent exe "normal `a<CR>"
  " restore the search value
  let @/ = saved_search
endfunction

" Autocommands
if has('autocmd')
    " Remove trailing whitespace from various files
    autocmd BufWritePre,FileWritePre *.html,*.rb,*.php,*.xml,*.erb call StripTrailingWhitespace()

    " Use 2 spaces for tabs in ruby and associated langs
    autocmd Filetype coffee,ruby,yaml,rake,rb,ru setlocal ts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead {*.rake,Podfile,Gemfile,Guardfile,Capfile,Rakefile,Thorfile,config.ru} set ft=ruby
    autocmd BufNewFile,BufRead Gemfile.lock set ft=yaml
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.prawn set ft=ruby
    autocmd BufNewFile,BufRead *.go set ft=go

    " Enable Less syntax
    autocmd BufRead,BufNewFile *.less set filetype=less

    " Enable SCSS syntax
    autocmd BufRead,BufNewFile *.scss set filetype=scss

    " Enable soft-wrapping for text files
    autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

    " Auto-resise windows when resizing
    autocmd VimResized * wincmd =

    " Folding on indent for HAML and coffee-script files
    autocmd BufNewFile,BufReadPost *.{coffee,haml} setl foldmethod=indent nofoldenable
endif

" Set open new windows below/to the right
set sb
set spr

" Set a nice status line
set statusline=%t%=%m\ %y\ [%c,%l]

" Highlight anything in column > 80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Remap Esc to ii
" imap ii <Esc>

" Airline
let g:airline_theme='light'
let g:airline_powerline_fonts=1

" Easy pasting, ripped from tpope/vim-unimpaired
function! s:setup_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  set paste
  set mouse=
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>

nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I
nnoremap <silent> ygi :call <SID>setup_paste()<CR>gi
nnoremap <silent> ygI :call <SID>setup_paste()<CR>gI

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   let &mouse = s:mouse |
        \   unlet s:paste |
        \   unlet s:mouse |
        \ endif
augroup END

" Mark the 79-character limit
let &colorcolumn=join(range(80,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

let g:ruby_indent_access_modifier_style="indent"
