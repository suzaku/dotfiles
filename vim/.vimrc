" no vi-compatible
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Required
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'Emmet.vim'
Plugin 'python.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kshenoy/vim-signature'
Plugin 'tomasr/molokai'
Plugin 'sprsquish/thrift.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'Lokaltog/vim-powerline'

syntax on

au BufRead,BufNewFile *.thrift set filetype=thrift 
au BufRead,BufNewFile *.sls set filetype=yaml

" tabs and spaces handling
:set smartindent
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set backspace=2

set encoding=utf-8

" always show status bar
set ls=2

" min num of lines to keep above/below the cursor
set scrolloff=2

" allow plugins by file type
filetype plugin on
filetype plugin indent on
filetype indent on

" incremental search
set incsearch

" highlighted search results
set hlsearch

" line numbers
set rnu

" automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" save as sudo
ca w!! w !sudo tee "%"

set background=dark
"let g:solarized_termcolors=256
colorscheme molokai

let python_highlight_all=1

" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add 
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can 
" change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

map <F6> /XXX<CR>

let mapleader = ","

" fuzzy finder
nmap <leader>R :FufRenewCache<CR>
nmap <leader>e :FufFile<CR>
nmap <leader>E :FufFileWithCurrentBufferDir<CR>
nmap <leader>g :FufBufferTag<CR>
nmap <leader>f :FufLine<CR>

" other shortcuts
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>x :x<CR>
imap <leader>w <ESC>:w<CR>
nmap <leader>b :Gblame<CR>
au FileType go nmap <leader>r <Plug>(go-run)

ab #X #XXX DIRTY
ab //X //XXX DIRTY
ab pdb import pdb; pdb.set_trace()

let g:user_emmet_settings = {
\  'indentation' : '    ',
\  'python': {
\    'snippets': {
\      'df' : "def ${cursor}():\n",
\      'ifm': "if __name__ == '__main__':\n",
\    }
\  }
\}

set statusline=%t%m%y%{fugitive#statusline()}%=(%c,%l)\ %L\ lines\ %p%%
