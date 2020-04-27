set nocompatible              " be iMproved, required
" set magic
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
filetype off                  " required

set incsearch hlsearch nowrapscan
set ignorecase smartcase

set scrolloff=3

set wildmenu wildmode=longest,list " Unix-like tab behaviour
set history=128

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number relativenumber ruler showcmd noshowmode
set cursorline

set showmatch
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'zxqfl/tabnine-vim'
Plugin 'nvie/vim-flake8'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-cursorword'
Plugin 'tpope/vim-commentary.git'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
call vundle#end()            " required
filetype plugin indent on
syntax on


" set textwidth=80 colorcolumn=80 linebreak

nnoremap Q @q

colorscheme PaperColor
" colorscheme monokai

"{{{ Autocommands
augroup vimrc_autocmds
  autocmd!

  "autocmd InsertEnter * set number norelativenumber
  "autocmd InsertLeave * set relativenumber

  autocmd FileType gitcommit setlocal colorcolumn=50

  autocmd FileType tsv setlocal noexpandtab

  autocmd FileType c,cpp
    \ set commentstring=//\ %s |
    \ set textwidth=80 colorcolumn=80 linebreak | 

  autocmd FileType python
    \ set textwidth=100 colorcolumn=100 linebreak | 
    \ set commentstring=\#\ %s

augroup END
"}}}


 " Easier moving in tabs and windows
 map <C-J> <C-W>j<C-W>_
 map <C-K> <C-W>k<C-W>_
 map <C-L> <C-W>l<C-W>_
 map <C-H> <C-W>h<C-W>_
 map <C-K> <C-W>k<C-W>_

 map <S-H> gT
 map <S-L> gt

set foldenable

map <C-n> : NERDTree<CR>

" NERDTress File highlighting

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ipynb', 'green', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('txt', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('sh', 'yellow', 'none', 'yellow', '#151515')


nmap <C-]> : YcmCompleter GoTo<CR>
nmap <Leader>d : YcmCompleter GetDoc<CR>
nmap <Leader>g : YcmCompleter GoToReferences<CR>

let mapleader="\\"


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \  'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set formatoptions+=r
set list
set listchars=trail:·
highlight comment ctermfg=lightblue
syntax on

autocmd BufWritePre *.[py,cpp,sh] :%s/\s\+$//e

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>l :Lines<CR>


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Rust.vim
let g:rustfmt_autosave = 1
let g:ycm_rust_src_path = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'

nmap <F9> :Crun<CR>
nmap <F8> :Cbuild<CR>
