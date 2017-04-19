"------------------------
"Start NeobundleSettings
"------------------------

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim//bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"Neobundle
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'itchyny/lightline.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"------------------------
"End NeobundoleSettings
"------------------------

"------------------------
"vim settings
"------------------------

syntax enable
set encoding=utf-8
set clipboard+=unnamed
set number
set title
set showmatch
set smartindent
set ruler
set laststatus=2
set showmode
set showcmd
set wildmenu
set hlsearch
set cursorline
set tabstop=4
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set t_Co=256
colorscheme railscasts


let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

"----------------------
"end vim settings
"----------------------

"----------------------
"start KeyMappings
"----------------------

inoremap <C-H>	<LEFT>
inoremap <C-J>	<DOWN>
inoremap <C-K>	<UP>
inoremap <C-L>	<RIGHT>
noremap <Space>j G
noremap <Space>k gg
noremap <Space>h ^
noremap <Space>l $

"---------------------
"end KeyMappings
"---------------------
