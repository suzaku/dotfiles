" no vi-compatible
set nocompatible
filetype off

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Required
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/Emmet.vim'
Plug 'vim-scripts/python.vim'
Plug 'vim-scripts/tagbar'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/vim-stylus'
Plug 'rust-lang/rust.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/vim-expand-region'
Plug 'lambdatoast/elm.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'ervandew/supertab'
Plug 'whatyouhide/vim-gotham'
Plug 'rizzatti/dash.vim'
Plug 'w0rp/ale'
Plug 'racer-rust/vim-racer'

let g:plug_url_format = 'git@github.com:%s.git'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
unlet g:plug_url_format

call plug#end()

syntax on

au BufRead,BufNewFile *.thrift set filetype=thrift 
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile Vagrantfile set filetype=ruby

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
colorscheme darkblue

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

set omnifunc=syntaxcomplete#Complete

map <F6> /XXXDFKJ<CR>

let mapleader = ","

" fuzzy finder
nmap <leader>R :FufRenewCache<CR>
nmap <leader>e :FufFile<CR>
nmap <leader>E :FufFileWithCurrentBufferDir<CR>
nmap <leader>g :FufBufferTag<CR>
nmap <leader>f :FufLine<CR>
let g:fuf_file_exclude = '\v\.pyc$|\.swp$|\.beam$'

" dash
nmap <leader>s <Plug>DashSearch

" other shortcuts
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>x :x<CR>
imap <leader>w <ESC>:w<CR>
nmap <leader>b :Gblame<CR>
au FileType go nmap <leader>r <Plug>(go-run)
nmap <leader>T :TagbarToggle<CR>

ab #X #XXX DIRTY
ab //X //XXX DIRTY
ab pdb import pdb; pdb.set_trace() #XXX DIRTY
ab ipdb import ipdb; ipdb.set_trace() #XXX DIRTY

let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
\  'indentation' : '    ',
\  'python': {
\    'snippets': {
\      'df' : "def ${cursor}():\n",
\      'ifm': "if __name__ == '__main__':\n",
\      'init': "def __init__(self, ${cursor}):",
\      'mock': "mocker.patch.object(m, '${cursor}')"
\    }
\  },
\  'go': {
\       'snippets': {
\           'int': "type ${cursor} interface {\n}",
\           'str': "type ${cursor} struct {\n}",
\           'main': "package main\n\nfunc main() {\n\t${cursor}\n}",
\           'err': "if err != nil {\n${cursor}\n}",
\           'go': "go func() {\n\t${cursor}\n}()"
\       }
\  }
\}

set statusline=%t%m%y%{fugitive#statusline()}%=(%c,%l)\ %L\ lines\ %p%%

au FileType html setlocal sw=2 ts=2 softtabstop=2
au FileType slim setlocal sw=2 ts=2 softtabstop=2
au FileType ruby setlocal ts=2 sts=2 sw=2
au FileType scss setlocal ts=2 sts=2 sw=2
au FileType yaml setlocal ts=2 sts=2 sw=2
au FileType coffee setlocal ts=2 sts=2 sw=2
au FileType go nmap <leader>m :GoImport <C-r><C-w><CR>
au FileType html,css,go,python EmmetInstall
au FileType python,rust nmap <silent> <leader>a :ArgWrap<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_register_as_syntastic_checker = 0
let g:syntastic_python_checkers = ['flake8', 'pylint']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set hidden
let g:racer_cmd = "/Users/satoru/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)
